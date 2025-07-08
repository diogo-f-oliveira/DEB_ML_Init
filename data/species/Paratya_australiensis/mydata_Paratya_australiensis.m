function [data, auxData, metaData, txtData, weights] = mydata_Paratya_australiensis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Atyidae';
metaData.species    = 'Paratya_australiensis'; 
metaData.species_en = 'Australian glass shrimp'; 

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFc', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L; L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 03 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 05]; 

%% set data
% zero-variate data

data.am = 6*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 1.5;   units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'Based on Lp/Li ratio of Palaemonetes varians: 4.2*1.9/5.2';
data.Li  = 4.2;   units.Li  = 'cm'; label.Li  = 'ultimate carapace length';   bibkey.Li  = 'Wals1993';
  comment.Li = 'based on LN data';

data.Wwb = 4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wals1993';
  comment.Wwb = 'based on egg length of 0.59 0.mm and diameter 0.36 mm: pi/6*0.059*0.036^2';
data.Wwi = 0.6;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Palaemonetes pugio and Li: 1*(4.2/5)^3';
  
% uni-variate data
% time-length data
data.tL = [ ... % stage (#), total length (cm)
1	0.171 % 3 (occasionally 4) d
2	0.210 % 3-4 d
3	0.253 % 3-4 d
4	0.289 % 3-5 d
5	0.321 % 3-4 d
6	0.383 % 3-7 d
7	0.434 % 3-5 d
8	0.505 % 3-5 d
];
data.tL(:,1) = [0 3 6.5 10 14 19 23 27];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wals1993'; comment.tL = 'Data from the Hopkins River; temp 18.5-22.5 C; 8 larval stages, then juvenile';
%
data.tL1 = [ ... % stage (#), total length (cm)
1	0.184
2	0.219
3	0.255
4	0.286
5	0.327
6	0.373
7	0.401
8	0.438];
data.tL1(:,1) = [0 3 6.5 10 14 19 23 27]; 
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length'};  
temp.tL1    = C2K(20.5);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Wals1993'; comment.tL1 = 'Data from Mt. Emu Creek in Panmure; temp 18.5-22.5 C;; 8 larval stages, then juvenile';

% length - fecundity
data.LN = [ ... % orbit-carapace length (cm), fecundity (#)
0.580	375.800
0.584	424.898
0.604	359.119
0.610	213.661
0.610	400.006
0.620	379.403
0.631	237.973
0.638	575.765
0.644	301.289
0.648	379.065
0.658	577.571
0.674	401.262
0.677	313.170
0.678	634.667
0.678	491.315
0.679	526.117
0.680	374.574
0.692	155.310
0.704	339.463
0.717	296.305
0.719	681.263
0.729	304.342
0.737	535.641
0.738	775.227
0.748	271.346
0.757	881.478
0.767	752.335
0.776	330.383
0.777	387.710
0.785	614.914
0.788	582.121
0.798	993.602
0.798	622.950
0.802	520.515
0.803	688.420
0.808	737.508
0.808	815.313
0.848	319.265
0.893	1121.442
0.898	353.459
0.950	586.274];
data.LN(:,1) = data.LN(:,1) * 4.43; % convert orbit-carapace to total length
units.LN   = {'cm','#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(20.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Wals1993'; comment.LN = 'Data from the Hopkins River; converted from orbit-carapace length using F1';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from Hopkins River, Mt. Emu Creek'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'total length = 4.43 * orbit-carapace length for drawing';
metaData.bibkey.F1 = 'Wals1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8VKYZ'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '1174246'; % ITIS
metaData.links.id_EoL = '4262394'; % Ency of Life
metaData.links.id_Wiki = 'Paratya_australiensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4604347'; % Taxonomicon
metaData.links.id_WoRMS = '4604347'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paratya_australiensis}}';
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
bibkey = 'Wals1993'; type = 'Article'; bib = [ ...
'author = {C. J. Walsh}, ' ...
'year = {1993}, ' ...
'title = {Larval Development of \emph{Paratya australiensis} {K}emp, 1917 ({D}ecapoda: {C}aridea: {A}tyidae), Reared in the Laboratory, with Comparisons of Fecundity and Egg and Larval Size between Estuarine and Riverine Environments}, ' ...
'journal = {Journal of Crustacean Biology }, ' ...
'volume = {13(3)}, ' ...
'pages = {456-480}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
