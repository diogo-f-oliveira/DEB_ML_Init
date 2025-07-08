function [data, auxData, metaData, txtData, weights] = mydata_Neophema_chrysogaster

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Neophema_chrysogaster'; 
metaData.species_en = 'Orange-bellied parrot'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-dWw'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 21;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 35;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 3.85;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 2.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'StojAlve2020';
  comment.Wwb = 'based on tW data';
data.Wwi = 45.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';

data.Ri  = 4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.25 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time - weight 
data.tW = [ ... % time since birth (d), wet weight (g)
0.750	4.635
0.813	2.745
0.853	10.685
1.804	4.260
1.909	9.648
3.899	9.464
5.014	8.428
6.006	9.376
6.815	14.104
6.832	31.968
7.897	26.677
8.107	12.311
8.808	37.833
8.880	31.879
8.995	32.824
9.857	39.821
9.875	31.881
9.927	34.906
9.948	25.832
10.061	27.723
10.816	29.993
10.860	36.043
10.864	34.719
10.877	28.765
10.884	26.024
10.887	24.701
10.889	23.945
10.924	33.680
11.614	38.975
11.720	43.890
11.776	45.024
12.789	37.182
12.802	31.511
12.895	41.908
12.899	40.207
13.865	27.828
13.891	41.533
13.897	38.886
13.910	33.404
14.047	50.135
14.737	30.004
14.756	47.017
14.927	48.908
15.066	39.835
15.854	53.164
15.873	44.752
15.878	42.673
15.921	49.289
15.924	48.155
15.926	47.304
15.941	40.971
15.946	38.703
16.736	51.465
16.800	48.913
16.802	48.346
16.802	47.968
16.821	39.840
16.907	53.356
16.933	42.014
17.803	45.419
17.845	52.602
17.853	49.294
17.866	43.718
17.891	33.132
17.905	51.941
18.771	57.047
18.783	52.038
18.785	51.187
18.804	43.059
18.853	47.217
18.895	54.117
19.831	54.214
19.836	52.324
19.839	51.001
19.904	48.165
19.908	46.464
19.911	45.141
20.826	54.217
20.887	53.083
20.892	51.098
20.899	48.074
20.904	46.089
20.906	45.333
20.914	41.930
21.817	56.205
21.821	54.314
21.826	52.329
21.836	48.076
21.878	54.976
22.007	50.061
22.821	52.238
22.824	50.914
22.872	55.357
22.886	49.308
23.697	53.185
23.699	52.145
23.886	47.326
24.867	53.094
24.870	52.054
24.896	40.996
24.919	56.119
24.921	54.984
24.942	46.005
25.764	45.157
25.799	55.270
25.816	48.087
26.761	44.025
26.852	55.273
26.860	52.059
26.864	50.169
26.931	46.578
26.967	56.124
27.791	54.141
27.912	52.629
27.914	51.590
27.916	50.928
27.925	47.147
28.098	48.188
28.859	48.190
28.861	47.055
29.784	53.013
29.848	50.839
29.866	42.899
30.900	51.125
30.903	50.180
30.905	49.140
31.897	50.372
31.906	46.780
33.949	48.960];
n = size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3; end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'StojAlve2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7483J'; % Cat of Life
metaData.links.id_ITIS = '177588'; % ITIS
metaData.links.id_EoL = '45517999'; % Ency of Life
metaData.links.id_Wiki = 'Neophema_chrysogaster'; % Wikipedia
metaData.links.id_ADW = 'Neophema_chrysogaster'; % ADW
metaData.links.id_Taxo = '54302'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7FB356E8E21E5294'; % avibase
metaData.links.id_birdlife = 'orange-bellied-parrot-neophema-chrysogaster'; % birdlife
metaData.links.id_AnAge = 'Neophema_chrysogaster'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neophema_chrysogaster}}';
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
bibkey = 'StojAlve2020'; type = 'article'; bib = [ ... 
'doi = {10.1080/01584197.2020.1743186}, ' ...
'author = {Dejan Stojanovic and Fernanda Alves and Matthew H. Webb and Shannon Troy and Catherine M. Young and Laura Raynera and Ross Crates and Henry Cooka and Rob Heinsohn}, ' ... 
'year = {2020}, ' ...
'title = {Nestling growth and body condition of critically endangered orange-bellied parrots \emph{Neophema chrysogaster}}, ' ...
'journal = {Emu}, ' ...
'volume = {37(3)}, ' ...
'pages = {1–7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Neophema_chrysogaster}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=7FB356E8E21E5294&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

