function [data, auxData, metaData, txtData, weights] = mydata_Hyporhamphus_unifasciatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hyporhamphus_unifasciatus'; 
metaData.species_en = 'Common halfbeak'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 04];

%% set data
% zero-variate data

data.am = 5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.9;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 20.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00234*Lp^3.09, see F1';
data.Wwi = 85.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00234*Li^3.09, see F1';

data.Ri = 4e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
20.411	1.814
25.214	2.029
40.822	3.735
43.224	2.779
45.625	5.120
46.826	4.163
48.026	3.525
54.030	3.633
57.632	5.017
68.438	5.339
78.043	8.321
85.247	6.514
92.451	7.793
97.253	10.986
102.056	8.328
102.056	7.796
117.664	8.651
120.066	13.333
121.266	12.908
126.069	12.909
129.671	13.655
130.872	12.166
132.072	12.592
132.072	11.528
136.875	14.082
139.276	14.402
140.477	10.254
141.678	14.509
142.878	13.020
148.882	12.597
152.484	14.832
153.684	15.364
164.490	15.473
165.691	16.857
172.895	16.540
174.095	17.604
175.296	17.392
183.701	18.032
184.901	14.203
187.303	16.012
187.303	17.289
192.105	19.099
195.707	18.461
205.313	18.251
213.717	23.147
216.118	18.148
219.720	22.511
225.724	20.172
226.924	19.002
231.727	20.387
236.530	21.346
237.730	18.686
241.332	19.538
244.934	19.646
265.345	19.652
271.349	24.334
279.753	21.890
280.954	22.103
285.757	22.530
297.763	24.342
300.164	21.364
319.375	22.753
320.576	20.944
327.780	22.649
399.819	24.797];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MontRibe2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'wet weight (g) = 0.00234*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYFR'; % Cat of Life
metaData.links.id_ITIS = '165474'; % ITIS
metaData.links.id_EoL = '46567001'; % Ency of Life
metaData.links.id_Wiki = 'Hyporhamphus_unifasciatus'; % Wikipedia
metaData.links.id_ADW = 'Hyporhamphus_unifasciatus'; % ADW
metaData.links.id_Taxo = '44437'; % Taxonomicon
metaData.links.id_WoRMS = '159281'; % WoRMS
metaData.links.id_fishbase = 'Hyporhamphus-unifasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus_unifasciatus}}'];
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
bibkey = 'Warb1979'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1979.tb03542.x}, ' ...
'author = {Warburton, K.}, ' ... 
'year = {1979}, ' ...
'title = {Growth and production of some important species of fish in a {M}exican coastal lagoon system}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {14(5)}, ' ...
'pages = {449–464}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontRibe2004'; type = 'incollection'; bib = [ ... 
'author = {Monteiro, A. and A.C. Ribeiro and M.F. Nóbrega and R.P. Lessa}, ' ... 
'editor = {R. P. Lessa and M. F. N\''{o}brega and J\''{u}nior, J. L. B.}, ' ...
'publisher = {Universidade Federal Rural de Pernambuco, Recife-Brazil, Departamento de Pesca}, ' ...
'year = {2004}, ' ...
'title = {\emph{Hyporhamphus unifasciatus}. Dinâmica de popula\c{c}\~{o}es e avalia\c{c}\~{a}o de estoques dos recursos pesqueiros da regi\~{a}o nordeste}, ' ...
'booktitle = {DIMAR}, ' ...
'volume = {II}, ' ...
'pages = {151-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus-unifasciatus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

