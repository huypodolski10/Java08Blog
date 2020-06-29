/*
 *@author Admin
 *@date Mar 9, 2020
*/
package com.devpro.java08blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.java08blog.entities.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer>{

}
