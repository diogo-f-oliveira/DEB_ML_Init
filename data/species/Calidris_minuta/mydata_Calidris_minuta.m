function [data, auxData, metaData, txtData, weights] = mydata_Calidris_minuta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_minuta'; 
metaData.species_en = 'Little stint'; 

metaData.ecoCode.climate = {'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 21;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'avibirds';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp is guessed';
data.tx = 18;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 54;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14.7*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.2;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ScheNehl1998';
data.Wwi = 25;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'ScheNehl1998';
  
data.Ri  = 2*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 - 5 eggs/clutch, male and female may breed separate clutches';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.071	4.473
0.071	4.355
0.071	4.197
0.107	5.103
0.107	4.945
0.108	4.788
0.108	4.591
0.109	4.000
0.109	3.922
0.109	3.804
0.110	3.685
0.110	3.489
0.446	4.592
0.447	4.434
0.522	4.277
0.522	4.120
1.009	5.026
1.010	4.908
1.010	4.672
1.010	4.593
1.011	4.436
1.011	4.357
1.011	4.200
1.011	4.042
1.012	3.885
1.012	3.806
1.012	3.648
1.012	3.530
1.984	6.525
1.985	6.013
1.986	5.541
1.987	5.147
1.988	4.320
1.988	4.202
1.989	4.045
1.989	3.927
2.025	4.990
2.025	4.911
2.025	4.832
2.025	4.753
2.025	4.675
2.025	4.517
2.960	7.472
2.960	7.276
2.961	7.000
2.962	6.134
2.962	6.016
2.963	5.819
2.963	5.701
2.963	5.583
2.964	5.386
2.964	4.992
3.004	3.969
3.033	8.654
3.936	8.026
3.972	8.932
3.972	8.853
3.972	8.774
3.973	8.459
3.975	7.436
3.975	7.278
3.975	7.121
3.976	7.003
4.008	9.522
4.014	6.648
4.014	6.452
4.015	6.294
4.015	6.176
4.948	9.958
4.950	8.738
4.986	9.486
4.989	8.147
4.989	8.068
5.027	7.596
5.030	6.218
5.957	12.953
5.958	12.480
5.960	11.417
5.998	10.984
6.968	15.081
6.972	13.074
6.974	12.011
7.909	14.572
8.013	19.100
8.953	19.181
8.953	19.063
8.953	18.945
8.953	18.827
8.955	17.961
8.955	17.724
8.957	17.094
8.957	17.055
8.959	15.953
8.960	15.480
8.961	15.008
8.961	14.890
9.029	18.669
9.967	19.617
9.968	18.869
10.006	19.105
10.008	17.963
11.018	20.328
11.058	19.029
12.889	25.215
12.973	20.373
13.005	23.444
13.006	22.893
13.007	22.459
13.007	22.105
13.008	21.515
14.998	23.252
14.998	23.173
14.998	23.055
15.106	25.536
17.061	25.738];
n=size(data.tW,1); for i=2:n; if  data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-8;end;end
n = size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-3;end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ScheNehl1998';

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
D1 = 'Body temperature only on target after a few days, as discussed in Kooy2010';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'PK4D'; % Cat of Life
metaData.links.id_ITIS = '176670'; % ITIS
metaData.links.id_EoL = '45509228'; % Ency of Life
metaData.links.id_Wiki = 'Calidris_minuta'; % Wikipedia
metaData.links.id_ADW = 'Calidris_minuta'; % ADW
metaData.links.id_Taxo = '53742'; % Taxonomicon
metaData.links.id_WoRMS = '212600'; % WoRMS
metaData.links.id_avibase = '9936FF4AFB430504'; % avibase
metaData.links.id_birdlife = 'little-stint-calidris-minuta'; % birdlife
metaData.links.id_AnAge = 'Calidris_minuta'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calidris_minuta}}';
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
bibkey = 'ScheNehl1998'; type = 'Article'; bib = [ ...  
'title = {Growth of Little Stint \emph{Calidris minuta} chicks on the {T}aimyr {P}eninsula, {S}iberia}, ' ...
'journal = {Bird Study}, ' ...
'year = {1998}, ' ...
'author = {H. Schekkerman and G. Nehls and H. H\"{o}tker and P. S. Tomkovich and W. Kania and P. Chylarecki and M. Soloviev and M. van Roomen}, ' ...
'volume = {45}, ' ...
'pages = {77--84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calidris_minuta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibirds'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.avibirds.com/html/Little_Stint.html}}';
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

