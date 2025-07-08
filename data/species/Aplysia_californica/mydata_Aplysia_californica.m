function [data, auxData, metaData, txtData, weights] = mydata_Aplysia_californica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Anaspidea'; 
metaData.family     = 'Aplysiidae';
metaData.species    = 'Aplysia_californica'; 
metaData.species_en = 'Sea hare'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'as'; 'ap'; 'am'; 'Lb'; 'Ls'; 'Lp'; 'Li'; 'Wwb'; 'Wws'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Michal Grossowicz'};    
metaData.date_subm = [2015 03 20];              
metaData.email    = {'micgros@gmail.com'};            
metaData.address  = {'University Tel Aviv'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Krei1977';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ts = 30;    units.ts = 'd';    label.ts = 'time since birth at start acc'; bibkey.ts = 'Krei1977';   
  temp.ts = C2K(22);  units.temp.ts = 'K'; label.temp.ts = 'temperature';
data.tp = 130;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Krei1977';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Care2015';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Care2015';
data.Ls  = 0.04; units.Ls  = 'cm';  label.Ls  = 'total length at start accel';   bibkey.Ls  = 'Care2015';
data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Care2015';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwb = 0.0092; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Krei1977';
data.Wws = 0.032; units.Wws = 'g';  label.Wws = 'wet weight at start accel';     bibkey.Wws = 'Krei1977';
data.Wwp = 400;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Krei1977';
data.Wwi = 3000;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

tN = [ ... % time  (d), eggs (#)
    0 148000000
    7  21587000
   13  24035000
   17  10550000
   23  30296000
   27  14674000
   31  17374000
   36  18277000
   41  15705000
   49  16450000
   55  15504000
   60   9392000
   63   9340000 
   66  16709000
   79  18329000
   82  10246000
   85   7988000
   92  12521000
   95  11831000
   98   8898000
  102   9288000
  106  10183000
  111   6235000
  113   2079000
  116   3583000
  127   8650000
  128   466000]; % eggs # at a certain day (Macg1934)

data.Ri  = sum(tN(:,2),1)/ 128;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Macg1934';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed; 2.6kg wet weight; ';
  
% uni-variate data

% t-L data
data.tL = [ ... % time since birth (d), body length (cm)
2.23621665 0.01519018
4.46980498	0.01768518
7.97702018	0.02169718
11.76989603	0.02386343
13.24105831	0.03135338
21.99587993	0.04060143
29.86514646	0.04226127
37.15095022	0.04339516
44.80813281	0.2056941
51.53476222	0.33149744
62.9791098	1.54931729
72.93086151	3.65858022
77.90066527	5.00591388
81.70997283	7.53756113
86.38839563	10.31373931
92.80436167	11.49598135
101.85128	15.09105716
123.4180274	16.56389216]; 
units.tL   = {'d', 'cm'};  label.tL = {'time', 'length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Care2015';

% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
58.09065898	0.01548399
61.3214962	0.03247549
68.63730596	0.08025246
73.93991835	0.42498186
76.00811627	0.96805317
80.41303343	2.59889623
89.83275384	40.9565072
93.63991289	71.36307151
98.9010922	114.4843909
100.3629705	132.1998716
102.6996897	155.8088753
110.2875764	220.8193889
123.7008308	293.9123366]; 
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(22);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Care2015';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'z jumps at start acceleration (= end planktontic stage) in this species';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Simultaneous hermaphrodite';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Planktonic stage till 37 d';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'FQ2Y'; % Cat of Life
metaData.links.id_ITIS = '78032'; % ITIS
metaData.links.id_EoL = '46448995'; % Ency of Life
metaData.links.id_Wiki = 'Aplysia_californica'; % Wikipedia
metaData.links.id_ADW = 'Aplysia_californica'; % ADW
metaData.links.id_Taxo = '255692'; % Taxonomicon
metaData.links.id_WoRMS = '240765'; % WoRMS
metaData.links.id_molluscabase = '240765'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aplysia_californica}}';
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
bibkey = 'Macg1934'; type = 'Article'; bib = [ ... 
'author = {Macginitie, G. E.}, ' ... 
'year = {1934}, ' ...
'title = {THE EGG-LAYING ACTIVITIES OF THE SEA HARE, \emph{Tethys californicus} ({C}OOPER)}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {67}, ' ...
'pages = {300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Krei1977'; type = 'Article'; bib = [ ... 
'author = {Kreigstein, A. R.}, ' ... 
'year = {1977}, ' ...
'title = {Stages in the Post-hatching Development of \emph{Aplysia californica}}, ' ...
'journal = {J. Exp. Zool.}, ' ...
'volume = {199}, ' ...
'pages = {275--288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Care2015'; type = 'Article'; bib = [ ... 
'author = {Carefoot, T.}, ' ... 
'year = {2015}, ' ...
'title = {Nudibranchs and relatives}, ' ...
'howpublished = {\url{http://www.asnailsodyssey.com/LEARNABOUT/NUDIBRANCH/nudiMeta.php}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Article'; bib = [ ... 
'author = {Dice, S.}, ' ... 
'year = {2014}, ' ...
'title = {Animal diversity web: Aplysia californica}, ' ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aplysia_californica}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

