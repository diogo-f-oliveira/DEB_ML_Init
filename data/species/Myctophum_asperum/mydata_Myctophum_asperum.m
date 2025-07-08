function [data, auxData, metaData, txtData, weights] = mydata_Myctophum_asperum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Myctophum_asperum'; 
metaData.species_en = 'Prickly lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.6); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 26]; 

%% set data
% zero-variate data
data.am = 1*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'HayaWata2001';  
  temp.am = C2K(6.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 8.5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 1.7; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Li^3.12, see F3';
data.Wwi = 3.1; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F3';
  
data.Ri = 1.5e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(6.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% tL data
data.tL = [ ... % time since metam (d), standard length (cm) 
4.680	1.576
7.134	1.604
7.438	1.550
8.365	1.687
9.590	1.660
9.598	1.824
10.825	1.824
11.430	1.660
14.495	1.633
14.806	1.716
17.870	1.662
19.400	1.607
20.022	1.772
22.468	1.635
26.788	2.171
29.843	1.938
32.914	2.035
35.993	2.268
44.569	2.079
46.433	2.545
49.792	2.272
50.719	2.423
52.563	2.505
67.607	2.851
69.470	3.304
83.317	4.252
87.599	4.034
101.091	4.037
102.024	4.284
106.936	4.394
120.160	5.151
125.988	5.179
128.737	4.975
128.754	5.303
130.601	5.441
132.136	5.469
135.778	4.743
135.793	5.031
156.673	5.584
162.786	5.188];
units.tL = {'d', 'cm'}; label.tL = {'time since metamorphosis', 'standard length'};  
temp.tL = C2K(6.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HayaWata2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 6.6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g = 0.00389*(SL in cm)^3.12';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44ZTP'; % Cat of Life
metaData.links.id_ITIS = '162721'; % ITIS
metaData.links.id_EoL = '46564198'; % Ency of Life
metaData.links.id_Wiki = 'Myctophum_asperum'; % Wikipedia
metaData.links.id_ADW = 'Myctophum_asperum'; % ADW
metaData.links.id_Taxo = '180517'; % Taxonomicon
metaData.links.id_WoRMS = '158903'; % WoRMS
metaData.links.id_fishbase = 'Myctophum-asperum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myctophum_asperum}}';
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
bibkey = 'HayaWata2001'; type = 'article'; bib = [ ...
'author = {Amane Hayashi and Hikaru Watanabe and Minoru Ishida and Kouichi Kawaguchi}, ' ... 
'year   = {2001}, ' ...
'title  = {Growth of \emph{Myctophum asperum} ({P}isces: {M}yctophidae) in the {K}uroshio and transitional waters}, ' ...
'journal = {Fisheries Science}, ' ...
'page = {983-984}, ' ...
'volume = {67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Myctophum-asperum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

