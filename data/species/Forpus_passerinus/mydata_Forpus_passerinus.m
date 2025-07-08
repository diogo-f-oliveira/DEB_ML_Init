function [data, auxData, metaData, txtData, weights] = mydata_Forpus_passerinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Forpus_passerinus'; 
metaData.species_en = 'Green-rumped parrotlet'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 06 11];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 06];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 21;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'WPT';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from PachBeis2010';  
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'WPT';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'LP';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9125;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'WPT';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'LP';

data.Wwb = 1.9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PachBeis2010';
data.Wwi = 25;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PachBeis2010';

data.Ri = 14/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'PachBeis2010','WaltBeis1992'};   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 7 eggs/clutch, so 2 clutches/yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0   1.8556594;
1	2.46896977;
2	2.94897618;
3	3.68450807;
4	4.7311493;
5	5.52229364;
6	6.44671335;
7	7.33779991;
8	9.21785552;
9	9.9978316;
10	10.75564281;
11	12.1466979;
12	14.28219318;
13	14.6955333;
14	16.9977229;
15	17.45550721;
16	18.80220393;
17	19.80440097;
18	19.99549153;
19	21.2865472;
20	22.48882891;
21	21.89106371;
22	21.98215484;
23	23.68434787;
24	23.36433025;
25	22.75548261;
26	23.16879412;
27	24.14876906;
28	23.5620863;
29	23.16434856;
30	23.38877227;
31	22.97983766;
32	22.30423791;
33	24.21762666;
34	23.28655864;
35	23.03317869];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'WaltBeis1992';
  
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
D2 = 'mod_2: v is reduced';
D3 = 'mod_2: food availability is taken variable in tW data';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6JJCL'; % Cat of Life
metaData.links.id_ITIS = '177734'; % ITIS
metaData.links.id_EoL = '1178014'; % Ency of Life
metaData.links.id_Wiki = 'Forpus_passerinus'; % Wikipedia
metaData.links.id_ADW = 'Forpus_passerinus'; % ADW
metaData.links.id_Taxo = '54427'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E43CCCA642160851'; % avibase
metaData.links.id_birdlife = 'green-rumped-parrotlet-forpus-passerinus'; % birdlife
metaData.links.id_AnAge = 'Forpus_passerinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Forpus_passerinus}}';
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
bibkey = 'PachBeis2010'; type = 'Article'; bib = [ ... 
'author = {Pacheco, M. A. and Beissinger, S. R. and Bosque, C.}, ' ... 
'year = {2010}, ' ...
'title = {Why grow slowly in a dangerous place? {P}ostnatal growth, thermoregulation, and energetics of nestling Green-rumped Parrotlets (\emph{Forpus passerinus})}, ' ...
'journal = {The Auk}, ' ...
'volume = {127}, ' ...
'number = {3}, '...
'pages = {558--570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WaltBeis1992'; type = 'Article'; bib = [ ... 
'author = {Waltman, J. R. and Beissinger, S. R.}, ' ... 
'year = {1992}, ' ...
'title = {Breeding behavior of the Green-rumped Parrotlet}, ' ...
'journal = {Wilson Bulletin}, ' ...
'volume = {104}, ' ...
'number = {1}, '...
'pages = {65--84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.bird-breeds.net/Green_Rumped_Parrotlet.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LP'; type = 'Misc'; bib = [ ...
'year = {2012}, ' ...
'title = {Lexicon of Parrots}, ' ...
'howpublished = {\url{http://www.arndt-verlag.com}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PE'; type = 'Misc'; bib = [ ...
'year = {2012}, ' ...
'title = {Pet Education}, ' ...
'howpublished = {\url{http://www.peteducation.com}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WPT'; type = 'Misc'; bib = [ ...
'year = {2012}, ' ...
'title = {World Parrot Trust}, ' ...
'howpublished = {\url{http://www.parrots.org}}'];
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

