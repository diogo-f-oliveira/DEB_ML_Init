function [data, auxData, metaData, txtData, weights] = mydata_Palaemon_elegans

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Palaemon_elegans'; 
metaData.species_en = 'Rockpool shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 08 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 26]; 

%% set data
% zero-variate data

data.ab = 10;  units.ab = 'd';      label.ab = 'age at birth';               bibkey.ab = 'BascBasc2002';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 22;  units.tj = 'd';      label.tj = 'time since birth at metam';  bibkey.tj = 'BascBasc2002';
  temp.tj = C2K(26);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 400;  units.am = 'd';     label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Palaemonetes pugio';


data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BascBasc2002';
  comment.Wwb = 'computed from egg length 0.65 mm and egg width 0.5 mm: pi/6*.05^2*.065';
data.Wwp = 0.500;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'BascBasc2002';
  comment.Wwp = 'smallest weight of shrimp with eggs; not fully clear that Wwp interpretation is correct';
data.Wwi = 1.43;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'BascBasc2002';
data.Wdi = 0.398;  units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'BascBasc2002';

data.Ri  = 1704/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'BascBasc2002';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data
data.tW = [ ... % time (d), wet weight (g)
0.000	0.122
6.910	0.134
13.914	0.155
20.852	0.173
27.920	0.197
34.931	0.211
41.802	0.230];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(19.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PalmBure2008';
  
data.LN = [ ... % total length (cm), fecundity (#)
 3.703	324.503
3.717	529.801
3.829	582.781
3.836	443.709
3.846	682.119
3.866	476.821
3.920	450.331
3.925	450.331
3.930	562.914
3.964	503.311
4.105	655.629
4.113	728.477
4.123	291.391
4.140	536.424
4.155	821.192
4.155	947.020
4.216	847.682
4.241	788.079
4.249	748.344
4.253	708.609
4.300	609.272
4.303	927.152
4.303	980.132
4.310	1125.828
4.310	754.967
4.337	668.874
4.352	874.172
4.377	794.702
4.389	788.079
4.397	947.020
4.404	701.987
4.414	701.987
4.426	927.152
4.439	423.841
4.471	927.152
4.471	1125.828
4.471	569.536
4.483	390.728
4.498	821.192
4.500	761.589
4.520	907.285
4.530	1205.298
4.567	1145.695
4.587	973.510
4.607	1264.901
4.646	894.040
4.654	1152.318
4.696	986.755
4.710	1039.735
4.720	814.569
4.730	1708.609
4.730	695.364
4.743	953.642
4.782	397.351
4.782	821.192
4.827	874.172
4.829	1258.278
4.864	1178.808
4.913	1238.411
4.995	1271.523
4.995	1099.338
5.012	1304.636
5.012	1192.053
5.017	1423.841
5.046	1317.881
5.269	1370.861
5.348	874.172
5.847	1629.139];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(26);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BascBasc2002';


%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = '3 nauplius stages in egg, 7 zoea stages (post hatch)';
metaData.bibkey.F1 = 'BascBasc2002'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '96466'; % ITIS
metaData.links.id_EoL = '46515113'; % Ency of Life
metaData.links.id_Wiki = 'Palaemon_elegans'; % Wikipedia
metaData.links.id_ADW = 'Palaemon_elegans'; % ADW
metaData.links.id_Taxo = '33864'; % Taxonomicon
metaData.links.id_WoRMS = '107614'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Palaemon_elegans}}';
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
bibkey = 'PalmBure2008'; type = 'Article'; bib = [ ...
'author = {J. Palma and D. P. Bureau and J. P. Andrade}, ' ...
'year = {2008}, ' ...
'title = {Effect of binder type and binder addition to artificial diets used for the growth of \emph{Palaemonetes varians} and \emph{Palaemon elegans}({C}rustacea: {P}alaemonidae) produced as aquaculture live preys}, ' ...
'journal = {Aquaculture International}, ' ...
'volume = {16}, ' ...
'pages = {427-436}, ' ...
'howpublished = {\url{https://link.springer.com/content/pdf/10.1007%%2Fs10499-007-9155-5.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BascBasc2002'; type = 'Article'; bib = [ ...
'author = {N. S. Ba\c{s}\c{c}{\i}nar and E. D\"{u}zg\"{u}ne\c{s} and N. Ba\c{s}\c{c}{\i}nar and  H. E. Salam}, ' ...
'year = {2002}, ' ...
'title = {A Preliminary Study on Reproductive Biology of \emph{Palaemon elegans} {R}athke, 1837 Along the South-eastern {B}lack {S}ea Coast}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {2}, ' ...
'pages = {109--116}, ' ...
'howpublished = {\url{https://link.springer.com/content/pdf/10.1007%%2Fs10499-007-9155-5.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

