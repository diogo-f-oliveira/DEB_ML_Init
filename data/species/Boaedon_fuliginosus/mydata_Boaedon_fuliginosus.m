  function [data, auxData, metaData, txtData, weights] = mydata_Boaedon_fuliginosus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lamprophiidae';
metaData.species    = 'Boaedon_fuliginosus'; 
metaData.species_en = 'African house snake'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biTa'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Le'; 't-Wwe'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 23]; 

%% set data
% zero-variate data
data.ab = 60;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'BobaDich2012';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 25.2;      units.Lb = 'cm';     label.Lb = 'total length at birth';  bibkey.Lb = 'BobaDich2012';
data.Lp = 72;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'Ford2001'; 
  comment.Lp = 'based on SVL 60 cm: 60*90/75 cm';
data.Li = 90;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'BobaDich2012';
  comment.Li = 'Ford2001 corresponds with SVL 75 cm';

data.Ww0 = 6.9;      units.Ww0 = 'g';     label.Ww0 = 'initial egg weight';  bibkey.Ww0 = 'Ford2001';
data.Wwi = 383.77;   units.Wwi = 'g';     label.Wwi = 'ultimate weight';  bibkey.Wwi = 'EoL';

data.Ri = 15/50;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'BobaDich2012';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 to 15 eggs per clutch, 1 clutch every 50 d; 97 eggs per yr';
  
% univariate data
% time embryo length
data.tLe = [ ... % age (d), total length (cm)
0.964	1.472
0.968	0.389
2.471	1.707
3.436	3.024
3.654	2.484
3.871	1.788
5.919	1.639
7.099	2.956
8.917	6.750
9.031	4.894
9.989	7.990
10.208	6.985
11.928	7.995
13.111	8.616
14.083	7.923
14.085	7.304
15.914	8.082
15.915	7.696
16.665	8.703
16.777	7.543
18.601	9.558
19.787	9.329
20.007	8.093
23.971	13.979
23.977	12.278
27.850	13.835
28.069	12.907
35.060	15.864
43.884	18.283
54.954	25.193];
units.tLe  = {'d', 'cm'};  label.tLe = {'age', 'embryo total length'};  
temp.tLe   = C2K(28);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'BobaDich2012';

% time - embryo weight
data.tWe = [ ... % age (d), weight (g)
0.955	0.016
2.894	0.017
4.078	0.017
6.125	0.019
6.988	0.081
7.958	0.097
9.036	0.143
9.792	0.236
10.004	0.082
12.053	0.176
13.024	0.284
14.207	0.177
15.932	0.270
16.149	0.332
17.117	0.271
18.198	0.457
19.057	0.318
20.028	0.380
20.134	0.319
23.046	0.521
23.047	0.552
23.156	0.660
23.159	0.783
24.015	0.460
24.236	0.784
26.926	0.631
28.218	0.601
30.065	1.465
30.068	1.650
30.171	1.357
33.936	1.066
35.005	0.619
37.930	1.531
37.931	1.624
43.973	2.120
45.037	1.427
46.013	1.767
46.026	2.491
46.224	1.551
55.025	5.751
55.137	5.967
55.989	5.443];
units.tWe  = {'d', 'g'};  label.tWe = {'age', 'embryo weight'};  
temp.tWe   = C2K(28);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'BobaDich2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tLe = 3 * weights.tLe;
weights.tWe = 3 * weights.tWe;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'M7VV'; % Cat of Life
metaData.links.id_ITIS = '1081916'; % ITIS
metaData.links.id_EoL = '47045966'; % Ency of Life
metaData.links.id_Wiki = 'Boaedon_fuliginosus'; % Wikipedia
metaData.links.id_ADW = 'Boaedon_fuliginosus'; % ADW
metaData.links.id_Taxo = '50099'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Boaedon&species=fuliginosus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boaedon_fuliginosus}}';
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
bibkey = 'BobaDich2012'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.zool.2011.09.001}, ' ...
'author = {Scott M. Boback and Eric K. Dichter and Hemlata L. Mistry}, ' ...
'year = {2012}, ' ...
'title = {A developmental staging series for the {A}frican house snake, \emph{Boaedon (Lamprophis) fuliginosus}}, ' ... 
'journal = {Zoology}, ' ...
'volume = {115}, '...
'pages = {38-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Ford2001'; type = 'Article'; bib = [ ... 
'author = {Neil B. Ford}, ' ...
'year = {2001}, ' ...
'title = {Reproduction in the brown house snake, \emph{Lamprophis fuliginosus}, from {T}anzania}, ' ... 
'journal = {African Journal of Herpetology}, ' ...
'volume = {50(1)}, '...
'pages = {31-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/47045966}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

