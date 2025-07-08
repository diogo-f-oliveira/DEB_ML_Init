function [data, auxData, metaData, txtData, weights] = mydata_Lanius_senator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Picathartidae';
metaData.species    = 'Picathartes_gymnocephalus'; 
metaData.species_en = 'White-necked rockfowl'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 06 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 20;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Thom2004';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'mean egg temp is guessed';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Thom2004';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Thom2004';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 12;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Thom2004';
% data.Wwx = 155;  units.Wwx = 'g';   label.Wwx = 'wet weight at fledging'; bibkey.Wwx = 'Thom2004';
data.Wwi = 250;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch; 2 clutches each yr';
  
% uni-variate data
% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.069	12.009
0.980	18.782
1.013	15.648
2.024	20.852
2.227	26.071
2.832	21.883
3.101	21.356
3.204	30.754
3.978	29.174
3.979	36.484
5.899	38.017
6.035	48.459
7.216	65.671
7.789	66.183
8.193	66.176
8.969	75.562
9.000	58.329
9.240	83.912
9.981	84.422
9.982	89.643
10.079	71.365
10.081	79.198
10.961	109.470
10.988	73.960
10.989	77.615
11.028	103.725
11.060	94.324
11.902	96.399
11.934	89.087
11.971	107.886
12.000	82.298
12.913	103.169
12.914	114.136
12.915	117.791
12.979	95.858
14.062	125.604
14.161	114.636
14.968	108.878
15.004	124.543
15.982	132.881
16.048	122.436
17.025	129.208
17.027	140.696
17.970	139.635
18.004	141.723
19.992	153.699
20.022	132.811
21.980	162.542
22.078	144.263
22.989	156.780
27.029	154.621];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
bibkey.tW = 'Thom2004';
  
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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Nests in mud nests, 2 m high in vertical rock surface';
metaData.bibkey.F1 = 'Thom2004'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4HPYJ'; % Cat of Life
metaData.links.id_ITIS = '562165'; % ITIS
metaData.links.id_EoL = '45514295'; % Ency of Life
metaData.links.id_Wiki = 'Picathartes_gymnocephalus'; % Wikipedia
metaData.links.id_ADW = 'Picathartes_gymnocephalus'; % ADW
metaData.links.id_Taxo = '57200'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '303653379A703A4F'; % avibase
metaData.links.id_birdlife = 'white-necked-rockfowl-picathartes-gymnocephalus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Picathartes_gymnocephalus}}';
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
bibkey = 'Thom2004'; type = 'Article'; bib = [ ... 
'author = {H. S. Thompson}, ' ... 
'year = {2004}, ' ...
'title = {The reproductive biology of the White-necked Picathartes \emph{Picathartes gymnocephalus}}, ' ...
'journal = {Ibis}, ' ...
'volume = {146}, ' ...
'pages = {615-622}'];
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

