function [data, auxData, metaData, txtData, weights] = mydata_Limnodynastes_peronii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Myobatrachidae';
metaData.species    = 'Limnodynastes_peronii'; 
metaData.species_en = 'Striped marsh frog'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTf', '0iTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 26]; 

%% set data
% zero-variate data

data.tj = 12*7; units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'HengBurg2002';
  temp.tj = C2K(22);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Hyla eximia: 7*2.3/3.75';
data.Li  = 7.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim = 7;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'Wiki';

data.Wwb = 1.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HengBurg2002';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwj = 0.4;   units.Wwj = 'g';   label.Wwj = 'wet weight at metam';   bibkey.Wwj = 'HengBurg2002';
  comment.Wwj = 'based on tW data at tj = 12*7 d';
data.Wwi = 35.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Hyla eximia: 4.4*(7.5/3.75)^3';
data.Wwim = 28.6;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Hyla eximia: 4.4*(7/3.75)^3';

data.Ri  = 1000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'HengBurg2002';   
temp.Ri  = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '704 to 1400 eggs per clutch, 1 clutch per yr'; 

% uni-variate data
% time-weight
data.tW = [ ... % time (d), tadpole wet weight (g)
14.01205	0.02000
14.14162	0.02476
14.14644	0.03238
14.14945	0.03714
14.14945	0.03714
14.18381	0.09143
42.04444	0.32119
42.04806	0.32690
42.06915	0.36024
42.25476	0.25357
42.38494	0.25929
69.90387	0.34904
69.91713	0.37000
70.04851	0.37762
70.05996	0.39571
98.14478	0.37976
98.15924	0.40262
98.20625	0.47690
98.23276	0.51881
98.69318	0.44643
126.06568	0.50476
126.09220	0.54667
126.32542	0.51524
126.33085	0.52381];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(22);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'HengBurg2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tW =  10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 10 * weights.psd.v;
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed, but that for tW is given';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6QDGZ'; % Cat of Life
metaData.links.id_ITIS = '663949'; % ITIS
metaData.links.id_EoL = '1048150'; % Ency of Life
metaData.links.id_Wiki = 'Limnodynastes_peronii'; % Wikipedia
metaData.links.id_ADW = 'Limnodynastes_peronii'; % ADW
metaData.links.id_Taxo = '87775'; % Taxonomicon
metaData.links.id_WoRMS = '1491038'; % WoRMS
metaData.links.id_amphweb = 'Limnodynastes+peronii'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limnodynastes_peronii}}';
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
bibkey = 'HengBurg2002'; type = 'Article'; bib = [ ...  
'author = {Tanya J. Hengl and Shelley Burgin}, ' ...
'year = {2002}, ' ...
'title  = {Reproduction and larval growth of the urban dwelling Brown Striped Marsh Frog \emph{Limnodynastes peronii}}, ' ...
'journal = {Australian Zoologist}, ' ...
'volme = {32(1)}, ' ...
'pages = {245-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Limnodynastes&where-species=peronii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

