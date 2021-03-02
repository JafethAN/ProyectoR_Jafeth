#Clientes
Customer=read.csv("C:/Users/jalfaro/Desktop/Clientes.csv")
View(Customer)

as.data.frame(Customer)
class(Customer)

ProdCat=factor(Customer$Categoria.de.Producto)
y=c(Customer$Monto)

#1
plot(ProdCat,y,
     main="Amount per Product Category",
     col=c("azure2","aquamarine3","darkolivegreen1","darkgoldenrod1"),
           xlab = "Product Category",ylab = "Amount")

#2
hist(Customer[Customer$Categoria.de.Producto=="Consolas",]$Monto,breaks=10, 
     main = "Order Quantity per Price for Consolas",
     xlab="Customer Amount",col = ("chocolate"))



#Tiendas
Store=read.csv("C:/Users/jalfaro/Desktop/Tiendas.csv")
View(Store)

as.data.frame(Store)
class(Store)

Tiendas=factor(Store$Nombre.Tienda)

#Testing barplot
plot(x=Tiendas)

bx=c(Store$Categoria.de.Producto)
by=c(Store$Numero.de.Proveedor)
barplot(by,names.arg = bx)


table(Store$Nombre.Tienda)
PerStore= table(Store$Categoria.de.Producto,Store$Nombre.Tienda)

#WIth Filter
PerStore2= table(Store$Categoria.de.Producto %in% c("Consolas","Videojuegos"),Store$Nombre.Tienda)


#3
barplot(PerStore, main = "Product Category per Store", 
        xlab = "Store",ylab = "Quantity of Products",
        col = c("cornsilk3","cyan3","beige","coral"))

#WIth Filter

barplot(PerStore2, main = "Product Category per Store", 
        xlab = "Store",ylab = "Quantity of Products",
        col = c("cornsilk3","cyan3"))
        legend(x="right",legend = c("Consolas","Videojuegos"),fill = c("cornsilk3","cyan3"),title("Product Category"))

#Testing bar ggplot

ggplot(data=Store,aes(x=Categoria.de.Producto,y=Numero.de.Proveedor, fill=Nombre.Tienda ))+geom_bar(stat="identity",position = "dodge")

#4 bar ggplot
 
ggplot(data=Store,aes(x=reorder(Categoria.de.Producto,-Numero.de.Proveedor),y=Numero.de.Proveedor, fill=Nombre.Tienda ))+geom_bar(stat="identity",position = "dodge")



#Testing Cantidad de Productos por Categoria de Producto

ggplot(Customer,aes(x="",y=Orden.de.Compra,fill=Categoria.de.Producto))+geom_bar(stat = "identity",width = 0.5)+coord_polar("y",start = 0)+theme_void()

#5
PG=ggplot(Customer,aes(x="",y=Orden.de.Compra,fill=Categoria.de.Producto))+geom_bar(stat = "identity",width = 3)+coord_polar("y",start = 0)+theme_void()
G5= PG + coord_polar("y",start = 0)
G5

#5 with Function
G5 + scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9","#999999"))
G5 + scale_fill_brewer(palette="Blues")

          
          
          
