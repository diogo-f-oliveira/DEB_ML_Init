function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_nudiventris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_nudiventris'; 
metaData.species_en = 'Fringebarbel Sturgeon'; 

metaData.ecoCode.climate = {'MB','BWk','BSk'};
metaData.ecoCode.ecozone = {'MAm','THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Saeid Esmaeilpour Poodeh','Jaap van der Meer'};                             
metaData.date_subm = [2019 02 18];                          
metaData.email     = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address   = {'Royal Netherlands Institute For Sea Research (NIOZ)'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 20]; 

%% set data
% zero-variate data;
data.ah = 5; units.ah = 'd';      label.ah = 'age at hatch';   bibkey.ah = 'guess';    
  temp.ah = C2K(12); units.temp.ah = 'K'; label.temp.ah = 'temperature';
   comment.ah = 'guess on the basis of Acipenser_sturio data with ah = 3 and ab = 16';
data.ab = 10; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'MikhElen2013';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 5475;  units.ap = 'd'; label.ap = 'age at puberty'; bibkey.ap = 'KottFrey2007';
  temp.ap = C2K(13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 13140; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Coad2018';   
  temp.am = C2K(13);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh  = 0.4;       units.Lh  = 'cm';  label.Lh  = 'total length at hatch'; bibkey.Lh  = 'SiddCoss2014';
data.Lb  = 1.5;      units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'MikhElen2013';
data.Li  = 211;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'MousGhaf2014';

data.Wwi = 80000;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'RochWill1991';

data.Ri  = 1187.2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'SiddCoss2014';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data 
data.tW = [ ... % time (d), wet weight (g)
    95 38.9
    365 65.7
    730 173.9
    1095 487.8 ];
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
  temp.tW = C2K(13);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Iran2017';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.0104 * (TL in cm)^2.780';
metaData.bibkey.F1 = 'MousGhaf2014';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64KGK'; % Cat of Life
metaData.links.id_ITIS = '161077'; % ITIS
metaData.links.id_EoL = '46561168'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_nudiventris'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_nudiventris'; % ADW
metaData.links.id_Taxo = '42438'; % Taxonomicon
metaData.links.id_WoRMS = '126277'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-nudiventris'; % fishbase


%% References
bibkey = 'Coad2018'; type = 'Misc'; bib = [ ...
'year = {2018}, ' ...
'author = {Brian W. Coad}, ' ...
'howpublished = {\url{http://www.briancoad.com/Species Accounts/Description and Acipenseridae to Chanidae.htm}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MousGhaf2014'; type = 'Article'; bib = [ ...    
'author = {Mousavi, S. and A. Ghafor}, ' ...
'year  = {2014}, ' ...
'title = {On the conditions impressing sturgeon fish}, ' ...  
'journal = {International Journal of Advanced and Applied Sciences}, ' ...
'volume = {4}, ' ...
'pages = {1-5}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iran2017'; type = 'techreport'; bib = [ ...    
'author = {Iran fisheries organization}, ' ...
'year  = {2017}, ' ...
'title = {Annual performance report}'  ]; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MikhElen2013'; type = 'Manual'; bib = [ ...    
'author = {Mikhail S. Chebanov and Elena V. Galich}, ' ...
'year  = {2013}, ' ...
'title = {Sturgeon Hatchery Manual}, ' ...  
'journal = {FAO}, ' ...
'pages = {303pp}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddCoss2014'; type = 'Article'; bib = [ ...  
'author = {Siddique, J. Cosson and M. Psenicka and O. Linhart}, ' ...
'year = {2014}, ' ...
'title = {Areview of the structure of sturgeon egg membrances and of the associated terminology}, ' ... 
'journal = {Applied Ichthyology}, ' ...
'pages = {1246-1255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RochWill1991'; type = 'Incollection'; bib = [ ...    
'author = {Rochard, E. and Williot. P. and Castelnaud, G. and Lepage, M.}, ' ...
'year  = {1991}, ' ...
'title = {Elements de systematique et de biologie des populations sauvages d esturgeons}, ' ...  
'Booktitle = {Acipenser}, '...
'Publisher = {Cemagref, Antony}, '...
'Editor = {Williot, P.}, ' ...
'pages = {475-507}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KottFrey2007'; type = 'Book'; bib = [ ... 
'author = {Kottelat, M and Freyhof, J}, ' ...
'year = {2007}, ' ...
'title  = {Handbook of European Freshwater Fishes}, ' ...
'publisher = {Maurice Kottelat (privately published)}, ' ...
'Address = {Berlin},' ...
'pages = {646 pp}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

