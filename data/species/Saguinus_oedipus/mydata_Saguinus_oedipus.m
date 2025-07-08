function [data, auxData, metaData, txtData, weights] = mydata_Saguinus_oedipus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Callitrichidae';
metaData.species    = 'Saguinus_oedipus'; 
metaData.species_en = 'Cotton-top tamarin'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHn', 'xiHs', 'xiCii', 'xiCvbe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 10]; 

%% set data
% zero-variate data

data.tg = 178 ;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 52 ;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 548 ;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 550 ;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26.2*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 39.36;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 105;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 445.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.990	53.695
2.937	74.683
4.883	96.906
7.054	133.956
8.768	163.596
10.710	195.706
12.885	222.870
14.944	248.799
17.004	275.964
18.722	293.247
20.894	326.589
22.960	333.983
24.793	352.500
26.956	411.793
28.912	405.594
31.094	410.515
32.694	436.449
34.880	430.248
36.839	417.870
38.787	432.679
40.836	489.502
42.907	484.538
44.976	483.280
46.811	496.855
48.645	510.429
50.716	504.229
52.784	507.915
54.628	494.303
56.808	505.402
58.760	509.089
60.948	497.945
62.899	507.811
64.740	501.613
66.922	506.534
68.874	512.692
70.824	523.794
72.888	538.601
74.839	545.996
76.791	552.154
78.852	575.612
80.921	574.355
82.874	576.807
84.480	587.912
86.774	600.246
88.737	574.275
90.807	573.018
92.524	592.772
94.822	595.220
96.660	597.672
98.727	602.594
100.687	586.509
102.636	601.318
104.932	607.473
106.768	617.340
108.614	598.785
110.682	601.235
112.631	616.044
114.813	619.729
116.750	667.903
118.821	662.938
120.798	597.424];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(36.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GintCarl2002';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwx = 0 * weights.Wwx;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Wwx ignorned due to inconsistency with tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4TZC5'; % Cat of Life
metaData.links.id_ITIS = '572933'; % ITIS
metaData.links.id_EoL = '323908'; % Ency of Life
metaData.links.id_Wiki = 'Saguinus_oedipus'; % Wikipedia
metaData.links.id_ADW = 'Saguinus_oedipus'; % ADW
metaData.links.id_Taxo = '65699'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100251'; % MSW3
metaData.links.id_AnAge = 'Saguinus_oedipus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saguinus_oedipus}}';
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
bibkey = 'GintCarl2002'; type = 'Article'; bib = [ ... 
'author = {Anita J. Ginther and Anne A. Carlson and Toni E. Ziegler and Charles T. Snowdon}, ' ... 
'year = {2002}, ' ...
'title = {Neonatal and Pubertal Development in Males of a Cooperatively Breeding Primate, the Cotton-Top Tamarin (\emph{Saguinus oedipus oedipus})}, ' ...
'journal = {Biology of Reproduction}, ' ...
'volume = {66}, ' ...
'pages = {282–290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Saguinus_oedipus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

