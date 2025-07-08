function [data, auxData, metaData, txtData, weights] = mydata_Vanellus_vanellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Vanellus_vanellus'; 
metaData.species_en = 'Northern lapwing'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0xTg', 'xiFm', 'xiFe'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 24;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp is guessed';
data.tx = 54;     units.tx = 'd';   label.tx = 'time since birth at fledging'; bibkey.tx = 'BeinViss1989';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-20 d';
data.tp = 162;     units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-20 d';
data.tR = 730;    units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24.5*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 17.1;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BeinViss1989';
% data.Wwx = 188.5;   units.Wwx = 'g';  label.Wwx = 'wet weight at fledging';  bibkey.Wwx = 'BeinViss1989';
data.Wwi = 218.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'AnAge';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.609	17.170
1.739	19.219
2.957	22.953
4.348	26.355
5.130	29.404
6.087	33.130
6.957	36.518
7.826	40.578
8.957	47.673
9.913	53.417
10.783	61.513
11.652	67.591
12.696	72.329
13.739	79.085
14.522	85.833
14.957	90.217
15.565	94.270
16.870	99.015
17.391	103.066
18.000	106.446
18.957	111.518
19.739	114.903
20.696	123.002
21.043	119.648
21.826	127.405
22.870	131.471
23.739	134.186
25.217	141.626
26.000	142.657
27.217	148.745
28.000	150.785
28.957	155.520
30.000	159.249
31.130	161.298
31.913	166.702
33.043	166.733
34.174	170.465
34.957	169.814
36.000	170.852
37.043	173.908
38.348	178.990
40.261	179.716
42.348	182.129
44.696	184.212
46.087	185.597
48.348	187.678
50.348	187.734
52.087	188.792
54.261	188.516];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BeinViss1989';

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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7FFJL'; % Cat of Life
metaData.links.id_ITIS = '176481'; % ITIS
metaData.links.id_EoL = '45509146'; % Ency of Life
metaData.links.id_Wiki = 'Vanellus_vanellus'; % Wikipedia
metaData.links.id_ADW = 'Vanellus_vanellus'; % ADW
metaData.links.id_Taxo = '53579'; % Taxonomicon
metaData.links.id_WoRMS = '159142'; % WoRMS
metaData.links.id_avibase = 'F029489ABD9D1334'; % avibase
metaData.links.id_birdlife = 'northern-lapwing-vanellus-vanellus'; % birdlife
metaData.links.id_AnAge = 'Vanellus_vanellus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vanellus_vanellus}}';
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
bibkey = 'BeinViss1989'; type = 'Article'; bib = [ ...  
'title = {GROWTH PARAMETERS IN CHICKS OF CHARADRIIFORM BIRDS}, ' ...
'journal = {Ardea}, ' ...
'year = {1989}, ' ...
'author = {A. J. Beintema and G. H. Visser}, ' ...
'volume = {77}, ' ...
'pages = {169-180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vanellus_vanellus}}';
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

