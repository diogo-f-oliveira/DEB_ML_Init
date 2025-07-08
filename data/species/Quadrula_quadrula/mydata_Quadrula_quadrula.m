function [data, auxData, metaData, txtData, weights] = mydata_Quadrula_quadrula
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Quadrula_quadrula'; 
metaData.species_en = 'Mapleleaf'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 05];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChriDavi2000';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 8.5*1.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'ChriDavi2000';

data.Wwi  = 47.9; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(11/7.3)^3';

data.Ri = 115e3/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate at SL 9.15 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Based on Quadrula cylindrica';
  
% uni-variate data
  
% time-length
data.tL1 = [ ... % time since birth (yr), shell depth (cm)
1.846	2.046
2.923	2.702
2.954	2.809
2.954	2.900
2.985	1.418
3.015	2.426
3.938	4.152
3.938	2.288
3.938	2.013
3.969	1.600
4.000	4.244
4.062	1.860
4.062	3.419
5.046	3.601
5.046	3.158
5.169	3.754
5.877	5.189
5.969	4.227
6.031	6.503
6.062	3.447
6.062	3.539
6.985	5.494
8.000	3.491
8.031	5.584
8.123	6.364
8.954	5.354
8.954	5.522
9.046	5.079
9.077	4.666
9.908	6.071
10.954	5.581
11.108	5.978
12.062	6.818
14.092	7.152
14.092	7.030
14.954	8.053
15.015	7.304
15.046	7.029
15.108	6.922
15.108	7.502
16.000	7.777
16.000	8.067
16.031	7.410
16.092	8.403
17.046	7.287];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
data.tL1(:,2) = data.tL1(:,2) * 1.3; % convert shell depth to shell length from photo
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'Ozark Lake, Arkansas'};  
temp.tL1 = C2K(11);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'ChriDavi2000';
comment.tL1 = 'Data from Ozark Lake, Arkansas; mean temperature is guessed';
%
data.tL2 = [ ... % time since birth (yr), shell depth (cm)
2.031	1.648
2.954	2.014
3.046	2.671
3.908	3.067
3.938	2.884
3.969	3.190
4.092	3.388
5.015	3.280
6.000	4.013
8.062	5.095
9.077	6.026
9.138	5.843
9.908	5.537
11.015	5.169
12.031	5.596
12.092	5.275
12.985	5.961
12.985	6.099
13.015	6.236
13.046	5.808
13.077	6.435
13.969	6.587
14.000	6.006
14.031	5.670
15.015	6.173
15.046	6.311
15.969	6.783
16.031	6.294
16.031	6.432
16.031	6.554
17.015	6.691
17.046	6.507
17.138	6.950
17.969	7.301
18.031	6.827
18.062	6.292
18.092	6.109
18.092	6.674
19.046	5.863
19.046	6.964
20.062	6.611
20.062	6.428
21.015	7.298
23.046	7.662
24.092	7.539];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
data.tL2(:,2) = data.tL2(:,2) * 1.3; % convert shell depth to shell length from photo
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Lake Dardanella, Arkansas'};  
temp.tL2 = C2K(7);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'ChriDavi2000';
comment.tL2 = 'Data from Lake Dardanella, Arkansas; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;
weights.tL2 = 5 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from Lakes Ozark, Dardanella, Arkansas'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4QZKF'; % Cat of Life
metaData.links.id_ITIS = '80060'; % ITIS
metaData.links.id_EoL = '395998'; % Ency of Life
metaData.links.id_Wiki = 'Quadrula_quadrula'; % Wikipedia
metaData.links.id_ADW = 'Quadrula_quadrula'; % ADW
metaData.links.id_Taxo = '557828'; % Taxonomicon
metaData.links.id_WoRMS = '857393'; % WoRMS
metaData.links.id_molluscabase = '857393'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Quadrula_quadrula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChriDavi2000'; type = 'Article'; bib = [ ...
'author = {Christian, Alan D. and Davidson, Chris L. and Posey, William R. and Rust, Peter J. and Farris, Jerry L. and Harris, John L. and Harp, George L.}, ' ... 
'year = {2000}, ' ...
'title = {Growth Curves of Four Species of Commercially Valuable Freshwater Mussels ({B}ivalva: {U}nionidae)}, ' ...
'journal = {Journal of the Arkansas Academy of Science}, ' ...
'volume = {54}, ' ...
'pages = {9}, ' ...
'howpublished = {\url{http://scholarworks.uark.edu/jaas/vol54/iss1/9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Quadrula_quadrula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

