  function [data, auxData, metaData, txtData, weights] = mydata_Americamysis_almyra
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Americamysis_almyra'; 
metaData.species_en = 'Opossum shrimp'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp 
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lb'; 'Li'; 'Wdi'; 'Ri'};  
metaData.data_1     = {'t-L_fT'};                          

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author  = {'Andre Gergs'};        
metaData.date_subm = [2020 11 19];                           
metaData.email    = {'andre.gergs@bayer.com'};                 
metaData.address  = {'Bayer AG'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 11 19]; 


%% set data
% zero-variate data
data.tp = 13;        units.tp = 'd';  label.tp = 'time since birth at puberty';          bibkey.tp = 'DomiLee1999';
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature';
   comment.tp = '13 days is release of first brood';
data.am = 0.25*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'NEME2005'; 
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';  

data.Lb = 0.16;     units.Lb = 'cm';  label.Lb = 'length at birth';  bibkey.Lb = 'DomiLee1999';  
data.Lp = 0.59;     units.Lp = 'cm';  label.Lp = 'length at release of first brood';  bibkey.Lp = 'DomiLee1999';
data.Li = 0.94;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'NEME2005'; 

data.Wdi = 0.5/1000; units.Wdi = 'g';     label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'ReitNeff1980';

data.Ri = 232/(1000*0.5); units.Ri = '#/d';  label.Ri = 'maximum reproduction rate';  bibkey.Ri = 'DomiLee1999';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
   comment.Ri = 'hatchling production of a population of 1000 mysids, we here assume a female:male ratio of 0.5'; 

% uni-variate data
% time-length
data.tL1 = [... % time (d), length (mm)
1 1.7155091813455998
3 2.4740017701983366
5 3.007093259533516
7 3.377482329182093
9 3.547340339329568
11 4.268266078262713
13 4.68861338618996
15 5.1841816572546975];
data.tL1(:,2) = data.tL1(:,2)/ 10; % convert mm to cm
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'length'};  
temp.tL1   = C2K(27);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'From Figure 1. Data from trial 1'; 
bibkey.tL1 = 'DomiLee1998';
% 
data.tL2 = [... % time (d), length (mm)
1 1.9284316292057797
3 2.524134535073612
5 3.1574915541593436
7 4.54205467668948
9 5.375680965381403
11 5.8586833214904575
13 5.87827393195956
15 5.998173703828366];
data.tL2(:,2) = data.tL2(:,2)/ 10; % convert mm to cm
units.tL2  = {'d', 'cm'};  label.tL2 = {'time since birth', 'length'};  
temp.tL2   = C2K(27);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'From Figure 1. Data from trial 2'; 
bibkey.tL2 = 'DomiLee1998';
% 
data.tL3 = [... % time (d), length (mm)
1 1.878386127628807
3 2.5867895832554195
5 3.670861538077964
7 4.7799344278644185
9  5.500903798446714
11 6.1090417243227755
13 6.228854232893278
15 6.0983956019297665];
data.tL3(:,2) = data.tL3(:,2)/ 10; % convert mm to cm
units.tL3  = {'d', 'cm'};  label.tL3 = {'time since birth', 'length'};  
temp.tL3   = C2K(27);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
comment.tL3 = 'From Figure 1. Data from trial 3'; 
bibkey.tL3 = 'DomiLee1998';
%
data.tL4 = [... % time (d), length (mm)
1.0198393212297328 1.8258924667532161
2.96449042527032 2.0638230605202432
5.023698960124786 2.4341152017005134
7.022071095385549 2.4080290055899
9.002759447482676 2.4906666846045704
10.964340942741464 2.5499492133108212
13.001094212111223 2.5861120266916
14.962926838018486 2.6687026187096814
16.906489709249005 2.8056316047921106
18.965028562374197 3.1137689104741657
20.945884334903646 3.21194529836339
22.983307286002674 3.310262947242383
24.94731637753008 3.59485675462966
26.947864978410983 3.7707737738882416
28.94849728950804 3.9544601475841];
data.tL4(:,2) = data.tL4(:,2)/ 10; % convert from mm to cm
units.tL4  = {'d', 'cm'};  label.tL4 = {'time since birth', 'length', '18 C'};  
temp.tL4   = C2K(18);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'DomiLee1999';
%
data.tL5 = [... % time (d), length (mm)
0.9611793872561654 1.6315173448315292
2.96449042527032 2.0638230605202432
4.967215491771361 2.4417432951480205
6.970359109353197 2.858510301962183
8.953809898583579 3.197536677406987
10.957623197894685 3.676458519719361
12.963947803690573 4.388460995150039
14.967258841704727 4.820766710838754
16.991434651096565 5.4395840200187
18.974048338165353 5.700916851090737
20.97501549012705 5.915680642535701
22.974894409278676 6.029442826296069];
data.tL5(:,2) = data.tL5(:,2)/ 10; % convert mm to cm
units.tL5  = {'d', 'cm'};  label.tL5 = {'time since birth', 'length', '22 C'};  
temp.tL5   = C2K(22);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
bibkey.tL5 = 'DomiLee1999';
%
data.tL6 = [... % time (d), length (mm)
0.9833835220923968 1.9423386093191892
2.9683410952136438 2.4212133646349745
4.900079898411674  3.210721036452062
6.965231858613443  4.132637342678981
8.939035045431476  5.326245619227638
10.981313189067743 5.875185825468684
12.943062104758848 5.950007063049489
15.000177884209336 6.126065343297839];
data.tL6(:,2) = data.tL6(:,2)/ 10; % convert mm to cm
units.tL6  = {'d', 'cm'};  label.tL6 = {'time since birth', 'length', '26 C'};  
temp.tL6   = C2K(26);  units.temp.tL6 = 'K'; label.temp.tL6 = 'temperature';
bibkey.tL6 = 'DomiLee1999';

%% grouped plots
set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'DomiLee1998 data for 3 trials'};
set2 = {'tL6', 'tL5', 'tL4'}; subtitle2 = {'DomiLee1999 at 26, 22, 18 C'};
metaData.grp.sets = {set1, set2}; metaData.grp.subtitle = {subtitle1, subtitle2};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Links
metaData.links.id_CoL = 'CR69'; % Cat of Life
metaData.links.id_ITIS = '682616'; % ITIS
metaData.links.id_EoL = '127328'; % Ency of Life
metaData.links.id_Wiki = 'Americamysis_almyra'; % Wikipedia
metaData.links.id_ADW = 'Americamysis_almyra'; % ADW
metaData.links.id_Taxo = '3464442'; % Taxonomicon
metaData.links.id_WoRMS = '161345'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DomiLee1998'; type = 'Article'; bib = [ ...  
'author = {Domingues, P.M. and Turk, P.E. and Andrade, J.P. and Lee, P.G. }, ' ...
'year = {1998}, ' ...
'title = {Pilot-scale production of mysid shrimp in a static water system}, ' ... 
'journal = {Aquaculture International}, ' ...
'volume = {6}, '...
'pages = {387-402}, '...
'doi = {10.1023/A:1009232921784}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'DomiLee1999'; type = 'Article'; bib = [ ...  
'author = {Domingues, P.M. and Turk, P.E. and Andrade, J.P. and Lee, P.G.}, ' ...
'year = {1998}, ' ...
'title = {Culture of the mysid, \emph{Mysidopsis almyra} ({B}owman), ({C}rustacea: {M}ysidacea) in a static water system: effects of density and temperature on production, survival and growth}, ' ... 
'journal = {Aquaculture Research}, ' ...
'volume = {30}, '...
'pages = {135-143}, '...
'doi = {10.1046/j.1365-2109.1999.00309.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'ReitNeff1980'; type = 'Article'; bib = [ ...  
'author = {Reitsema L.A. and Neff J.M.A}, ' ...
'year = {1980}, ' ...
'title = {Recirculating Artificial Seawater System for the Laboratory Culture of \emph{Mysidopsis almyra} ({C}rustacea; {P}ericaridea)}, ' ... 
'journal = {Estuaries}, ' ...
'volume = {3}, '...
'pages = {321-323}, '...
'doi = {10.2307/1352089}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NEME2005'; type = 'data base'; bib = [ ...  
'author = {Nemesis data base}, ' ...
'year = {modified on Friday, September 9th, 2005}, ' ...
'title = {http://invasions.si.edu/nemesis/CH-ECO.jsp?Species_name=Americamysis+almyra}, ' ... 
];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



