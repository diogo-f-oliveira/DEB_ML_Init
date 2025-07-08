function [data, auxData, metaData, txtData, weights] = mydata_Cuthona_nana

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Nudibranchia'; 
metaData.family     = 'Tergipedidae';
metaData.species    = 'Cuthona_nana'; 
metaData.species_en = 'Aeolid nudibranch'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCih'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-JX'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Rive1978';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 80;    units.tj = 'd';    label.tj = 'time since birth at puberty'; bibkey.tj = 'Foli1993';
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'read from tL-curve for inflection point';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'From tL-curve for Lp = 1 cm';
data.am = 125;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Foli1993';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.5;    units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'Foli1993';
  comment.Lj = 'read from tL-curve for inflection point';
data.Lp  = 1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Foli1993';
  comment.Lp = '0.9-1.1 cm';
data.Li  = 2.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Foli1993';
  comment.Li = 'marinelife gives 2.8 cm';
  
data.Wwb = 2.145e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Rive1978';
  comment.Wwb = 'based egg diameter of 160 mum: pi/6*0.016^3';
data.Wwi = 0.14; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'estimate based on pi * .12^2 * 2.3^3/ 4, where .12 is aspect ratio';

data.Ri  = 16 * 400/ 25; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Chri1977';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), wet weight (g)
56      0.106
62.862	0.167
73.289	0.318
79.087	0.511
86.142	0.899
93.097	1.246
100.227	1.498
106.964	1.644
122.131	1.868];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Foli1993';

% L-JX data
data.LJX = [ ... % length (cm), feeding rate (mg/d)
0.348	1.156
0.400	0.444
0.401	3.289
0.401	4.194
0.506	0.001
0.507	2.899
0.507	5.355
0.507	5.679
0.508	6.067
0.608	5.159
0.699	3.088
0.705	8.843
0.800	6.384
0.806	9.422
1.002	7.802
1.008	8.965
1.199	5.793
1.296	8.959
1.296	9.864
1.298	0.037
1.304	4.886
1.394	2.815
1.395	5.918
1.396	6.565
1.491	5.916
1.492	6.304
1.498	10.313
1.600	1.323
1.607	7.336
1.804	8.690
1.903	2.868
2.197	5.578
2.504	6.153];
units.LJX   = {'cm', 'mg/d'};  label.LJX = {'total length', 'feeding rate'};  
temp.LJX    = C2K(12);  units.temp.LJX = 'K'; label.temp.LJX = 'temperature';
bibkey.LJX = 'Foli1993';

% t-L data
data.Tab = [ ... % Temp (C), time till metam (d)
 4 52.5
 8 35
12 21.5
16 16.5];
units.Tab   = {'C', 'd'};  label.Tab = {'time since birth', 'time till metam'};  
bibkey.Tab = 'Rive1978';

%% set weights for all real data
weights = setweights(data, []);
weights.LJX(data.LJX(:,2) < 1) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Feeds on hydroid Hydractinia echinata (0.018 mg/ polyp) large individuals eat polyps, small ones mat material (stolons)';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'max length at Gerrish Island 1.2 cm, Gosport Harbor 2.3 cm';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'survives 16 C with 2 water refreshments/d';
metaData.bibkey.F3 = 'Rive1978'; 
F4 = 'up to 16 egg masses in lab of 300-600 eggs, first and last smaller. Veliger larva do not swim freely and metaphose wihtin 1 or 2 d';
metaData.bibkey.F4 = 'Rive1978'; 
F5 = ['Adult specimens of C. nana kept without food in Millipore-filtered sea water continued to lay egg masses for up to ten days. ',  ...
 'The size and activity of the adults progressively diminished during that time, but some starved individuals survived for 17 days. ', ...
 'They laid several egg masses in the first few days of isolation, but the frequency of oviposition and the number of eggs per spawn decreased with time. ' ...
 'Mean egg diameter did not vary, and the rate and events of larval development and metamorphosis proceeded normally in the presence or absence of H. echinata.'];
metaData.bibkey.F5 = 'Rive1978'; 
F6 = 'hermaphrodite';
metaData.bibkey.F6 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6);

%% Links
metaData.links.id_CoL = '32MS3'; % Cat of Life
metaData.links.id_ITIS = '78618'; % ITIS
metaData.links.id_EoL = '46451354'; % Ency of Life
metaData.links.id_Wiki = 'Cuthona_nana'; % Wikipedia
metaData.links.id_ADW = 'Cuthona_nana'; % ADW
metaData.links.id_Taxo = '339845'; % Taxonomicon
metaData.links.id_WoRMS = '141627'; % WoRMS
metaData.links.id_molluscabase = '141627'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cuthona_nana}}';
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
bibkey = 'Chri1977'; type = 'Article'; bib = [ ... 
'author = {Christensen, H. E.}, ' ... 
'year = {1977}, ' ...
'title = {Feeding and reproduction in  \emph{Precuthona peachi} ({M}ollusca: {N}idubranchia)}, ' ...
'journal = {Ophelia}, ' ...
'volume = {16}, ' ...
'pages = {131--142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rive1978'; type = 'Article'; bib = [ ... 
'author = {Rivest, B. R.}, ' ... 
'year = {1978}, ' ...
'title = {Development of the eolid nudibranch \emph{Cuthona nana} ({A}lader and {H}ancock, 1842), and its relationship with a hydroid and hermit crab}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {154}, ' ...
'pages = {157--175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Foli1993'; type = 'Article'; bib = [ ... 
'author = {Folino, N. C.}, ' ... 
'year = {1993}, ' ...
'title = {Feeding and growth of the aeolid nudibranch \emph{Cuhona nana} ({A}lder and {H}ancock, 1842)}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {59}, ' ...
'pages = {15--22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marinelife'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.habitas.org.uk/marinelife/species.asp?item=W14710}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

