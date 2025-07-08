function [data, auxData, metaData, txtData, weights] = mydata_Chelictinia_riocourii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Chelictinia_riocourii'; 
metaData.species_en = 'Scissor-tailed kite'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KempKirw2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '27-31 d';
data.tx = 33.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'KempKirw2020';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '32-35 d';
data.tp = 100.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '32-35 d';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 16.8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 12;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MullCava2014';
data.Wwi = 110; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 110; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, 1 clutch per yr; KempKirw2020 gives 2.5 eggs per clutch';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.875	17.072
1.045	10.249
1.988	26.943
2.025	11.398
2.090	23.532
2.091	21.257
2.091	19.740
2.092	16.328
2.092	12.916
3.002	26.576
3.004	17.476
3.032	41.742
3.035	29.609
3.982	25.450
4.995	28.874
5.030	23.188
6.005	47.844
6.006	44.052
6.006	40.261
6.007	37.607
6.947	64.158
7.018	50.889
7.019	47.097
7.019	44.443
7.020	39.894
7.056	30.036
7.929	57.345
7.929	55.449
7.993	73.649
7.996	60.000
9.045	50.913
10.021	69.882
10.024	56.991
10.937	54.727
11.003	61.552
11.943	91.895
11.979	82.038
11.980	75.213
11.981	69.526
11.985	50.569
12.010	94.929
12.016	63.081
12.920	104.039
12.990	93.045
13.027	76.363
14.984	89.277
14.987	76.765
15.933	76.018
15.965	87.014
16.935	132.523
16.971	123.803
16.975	103.329
16.978	89.301
17.008	108.638
17.015	75.652
17.952	117.748
18.025	91.967
19.918	89.715
19.948	107.156
20.963	101.101
21.909	103.388
21.910	98.079
21.941	107.938
21.973	119.312
21.974	115.142
22.003	134.858
22.954	110.983
23.015	144.349
24.979	123.898
25.050	107.975
25.966	89.028
26.945	94.348
27.989	110.284
29.950	105.758
30.993	127.002
30.994	124.348];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MullCava2014';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '69R8H'; % Cat of Life
metaData.links.id_ITIS = '559183'; % ITIS
metaData.links.id_EoL = '45515784'; % Ency of Life
metaData.links.id_Wiki = 'Chelictinia_riocourii'; % Wikipedia
metaData.links.id_ADW = 'Chelictinia_riocourii'; % ADW
metaData.links.id_Taxo = '52409'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '22832FF4C1180B06'; % avibase
metaData.links.id_birdlife = 'scissor-tailed-kite-chelictinia-riocourii'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelictinia_riocourii}}';
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
bibkey = 'MullCava2014'; type = 'Article'; bib = [ ... 
'author = {W.C. Mulli\''{e} and S. Cavaill\`{e}s and J. Komdeur and R. Buij}, ' ... 
'year = {2014}, ' ...
'title = {Chick development, growth and post-juvenile moult of the {A}frican Swallow-tailed Kite \emph{Chelictinia riocourii} in {S}enegal and {C}ameroon}, ' ...
'journal = {Malimbus}, ' ...
'volume = {36}, ' ...
'pages = {77-81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=22832FF4C1180B06&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KempKirw2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.sctkit1.01}, ' ...
'author = {Kemp, A. C. and G. M. Kirwan and J. S. Marks}, ' ...
'year = {2020}, ' ...
'title = {Scissor-tailed Kite (\emph{Chelictinia riocourii}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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

