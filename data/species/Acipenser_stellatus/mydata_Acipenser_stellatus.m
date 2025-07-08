  function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_stellatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_stellatus'; 
metaData.species_en = 'Starry Sturgeon'; 

metaData.ecoCode.climate = {'MB','BWk','BSk','Dfb'};
metaData.ecoCode.ecozone = {'MAm','THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Saeid Esmaeilpour Poodeh','Jaap van der Meer'};        
metaData.date_subm = [2018 11 13];                           
metaData.email    = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address  = {'Royal Netherlands Institute For Sea Research (NIOZ)'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 21]; 

%% set data
% zero-variate data
data.ah = 6;     units.ah = 'd';   label.ah = 'age at birth';           bibkey.ah = 'guess'; 
  temp.ah = C2K(18); units.temp.ah = 'K'; label.temp.ah = 'temperature';
comment.ah = 'guess on the basis of Acipenser_sturio data with ah = 3 and ab = 16';
data.ab = 10; units.ab = 'd'; label.ab = 'age at birth';     bibkey.ab = 'GhasNoor2018'; 
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4380;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'KottFrey2007';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for female: ap = 8-14 yr; for males: ap = 6-12 yr (KottFrey2007)';
data.am = 7665;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'Coad2018';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 1.8;      units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'MikhElen2013';
data.Lp = 120;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'Birs1993'; 
data.Li = 220;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'MousGhaf2014';

data.Wwh = 0.011; units.Wwh = 'g';   label.Wwh = 'wet weight at hatch';    bibkey.Wwh = 'MikhElen2013';
data.Wwi = 80000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Frim1995';
  
data.Ri = 246.5; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = {'SiddCoss2014'};   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';
    
% uni-variate data
% time-weight
data.tW = [... % time since birth (d), wet weight (g)
    5 0.06
    15 0.5
    20 1.0
    25 1.2
    30 1.5
    35 2.0
    40 3.0
    45 5.0
    50 6.0];
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(18); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MikhElen2013';
 
%% set weights for all real data
weights = setweights(data, []);
weights.ap = 0;
weights.ah = 3;
weights.ab = 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'weight 0 was given to Wh, because value does not seem realistic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.0104 * (TL in cm)^2.780';
metaData.bibkey.F1 = 'MousGhaf2014';

F2 = 'Growth parameters of Von bertalanffy equation in males is: infinity length = 131.2 cm, growth coefficien (k) = 0.15, time at 0 age (t0) = -0.47 and for females is: infinity length = 153.69 cm, growth coefficien (k) = 0.08, time at 0 age (t0) = -3.78';
metaData.bibkey.F2 = 'BakhAbdo2012';

metaData.facts = struct('F1',F1,'F2',F2);
   
                              
%% Links
metaData.links.id_CoL = '9C7L'; % Cat of Life
metaData.links.id_ITIS = '161078'; % ITIS
metaData.links.id_EoL = '46561169'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_stellatus'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_stellatus'; % ADW
metaData.links.id_Taxo = '42444'; % Taxonomicon
metaData.links.id_WoRMS = '126278'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-stellatus'; % fishbase


%% References
bibkey = 'Coad2018'; type = 'Misc'; bib = [ ...
'year = {2018}, ' ...
'author = {Brian W. Coad}, ' ...
'howpublished = {\url{http://www.briancoad.com/Species Accounts/Description and Acipenseridae to Chanidae.htm}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Birs1993'; type = 'article'; bib = [ ...    
'author = {Birstein, V. J}, ' ...
'year  = {1993}, ' ...
'title = {Sturgeons and paddlefishes: threatened fishes in need of conservation}, ' ...  
'journal = {Conservation Biology}, ' ...
'pages = {773-787}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MousGhaf2014'; type = 'Article'; bib = [ ...    
'author = {Mousavi, S. and Ghafor, A.}, ' ...
'year  = {2014}, ' ...
'title = {On the conditions impressing sturgeon fish}, ' ...  
'journal = {International Journal of Advanced and Applied Sciences}, ' ...
'volume = {4}, ' ...
'pages = {1-5}']; 
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
bibkey = 'GhasNoor2018'; type = 'Article'; bib = [ ...    
'author = {Ghasemi, N. and Noori. F. and Imani, A. and Shahrooz, R.},' ... 
'title = {Ontogeny of proteolytic enzymes (pepsin, trypsin and chymotrypsin) of Stellate \emph{Acipenser stellatus} from hatching up to day 50 post hatch}, ' ...  
'journal = {Iranian Scientific Fisheries Journal}, ' ...
'year = {2018}, ' ...
'volume = {1}, ' ...
'pages = {107-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakhAbdo2012'; type = 'Article'; bib = [ ...    
'author = {Bakhshalizadeh, S. and Abdolmalaki, S. and Ban, A.}, ' ...
'year  = {2012}, ' ...
'title = {Aspects of the life history of \emph{Acipenser stellatus} ({A}cipenseriformes, {A}cipenseridae), the starry sturgeonBak, in {I}ranian waters of the {C}aspian {S}ea}, ' ...  
'journal = {Aqua, International Journal of Ichthyology}, ' ...
'volume = {2}, ' ...
'pages = {103-112}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddCoss2014'; type = 'Article'; bib = [ ...  
'author = {Siddique, M. A. M. and Cosson, J. and Psenicka, M.  and Linhart, O.}, ' ...
'year = {2014}, ' ...
'title = {A review of the structure of sturgeon egg membrances and of the associated terminology}, ' ... 
'journal = {Applied Ichthyology}, ' ...
'pages = {1246-1255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KottFrey2007'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kottelat M. and Freyhof, J.}, ' ...
'year = {2007}, ' ...
'title  = {Handbook of European Freshwater Fishes}, ' ...
'publisher = {Maurice Kottelat (privately published)}, ' ...
'Address = {Berlin},' ...
'pages = {646 pp}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Frim1995'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Frimodt, C.}, ' ...
'year = {1995}, ' ...
'title  = {Multilingual illustrated guide to the worlds commercial coldwater fish}, ' ...
'publisher = {Wiley-Blackwell}, ' ...
'Address = {Berlin},' ...
'pages = {215 pp}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

