function [data, auxData, metaData, txtData, weights] = mydata_Bathyergus_janetta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Bathyergidae';
metaData.species    = 'Bathyergus_janetta'; 
metaData.species_en = 'Namaqua dune mole-rat'; 
metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 10 24];              

%% set data
% zero-variate data

data.tg = 70;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on other mole-rats';
data.tx = 28;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'BennJarv1991';   
  temp.tx = C2K(34);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(34); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 15;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BennJarv1991';
data.Wwi = 390;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BennJarv1991';

data.Ri  = 7/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BennJarv1991';   
  temp.Ri = C2K(34); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.590	16.223
2.702	19.828
3.643	16.481
4.918	23.433
9.763	24.979
14.509	30.129
17.768	27.554
21.788	39.142
23.893	38.884
25.897	40.944
27.933	61.803
30.868	54.592
35.722	61.288
41.855	76.996
42.670	61.545
48.787	68.755
51.949	70.815
55.778	93.476
56.588	74.936
62.700	79.056
73.042	93.991];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BennJarv1991';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 10 * weights.Wwi;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'KWZ9'; % Cat of Life
metaData.links.id_ITIS = '584666'; % ITIS
metaData.links.id_EoL = '326572'; % Ency of Life
metaData.links.id_Wiki = 'Bathyergus_janetta'; % Wikipedia
metaData.links.id_ADW = 'Bathyergus_janetta'; % ADW
metaData.links.id_Taxo = '89611'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400005'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyergus_janetta}}';
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
bibkey = 'BennJarv1991'; type = 'Article'; bib = [ ... 
'author = {N. C. Bennett and J. U. M. Jarvis and G. H. Aguilar and E. J. McDaid}, ' ... 
'year = {1991}, ' ...
'title = {Growth and development in six species of {A}frican mole-rats ({R}odentia: \emph{Bathyergidae})}, ' ...
'journal = {J. Zool., Lond}, ' ...
'volume = {225}, ' ...
'pages = {13--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

