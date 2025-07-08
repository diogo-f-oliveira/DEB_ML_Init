function [data, auxData, metaData, txtData, weights] = mydata_Carettochelys_insculpta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Carettochelyidae';
metaData.species    = 'Carettochelys_insculpta'; 
metaData.species_en = 'Pig-nosed turtle'; 

metaData.ecoCode.climate = {'Af', 'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTd', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biHs'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-WwVe'; 't-JOe'; 't-WwYe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 06];

%% set data
% zero-variate data

data.tp = 14*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'arkive';
  temp.tp = C2K(30);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 18 yr';
data.am = 38.4*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'ADW';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 5.7; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'arkive';
data.Lp = 38; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'DoodGeor2003';
data.Li = 65; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'arkive';
  comment.Li = 'Wiki and arkive give 70 cm';

data.Wwb = 22; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'WebbChoq1986';
data.Wwp = 6000; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'DoodGeor2003';
data.Wwi = 30000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'arkive';

data.Ri  = 39/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = {'arkive','DoodGeor2003'};   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 39 eggs per clutch, 2 clutches each other year, 41 d apart';
  
% uni-variate data

data.aW = [ ... % age (d), embryo weight (g) 
      24 0.42876;
      34 1.4436;
      44 4.6592;
      54 11.52261;
      64 16.93948;
      74 19.11912;
      84 19.67712;
      88.99 20.18744;
      89. 20.961];
units.aW   = {'d', 'g'};  label.aW = {'age', 'embryo weight'};  
temp.aW    = C2K(30);  units.temp.aW = 'K'; label.temp.aW = 'temperature';
bibkey.aW = 'WebbChoq1986';

data.aWY = [ ... % age (d), yolk weight (g)
      0   13.93175;
      2.5 12.01861;
      4   9.23984;
      14  13.69786;
      24  13.86324;
      34  11.42048;
      44  11.18208;
      54  9.84456;
      64  4.87912;
      74  2.74659;
      84  1.28544;
      88.99  0.9912;
      89  1.33575];
units.aWY   = {'d', 'g'};  label.aWY = {'age', 'yolk weight'};  
temp.aWY    = C2K(30);  units.temp.aWY = 'K'; label.temp.aWY = 'temperature';
bibkey.aWY = 'WebbChoq1986';
  
data.aJO = [ ... % age (d), O_2 consumption (ml/d)
       14.97738138 4.721137638;
       21.16929769 5.561583302;
       21.18347466 6.531196534;
       22.28145638 7.662893676;
       22.57144073 6.363617655;
       27.06772364 10.10305934;
       33.21954836 13.48458282;
       34.89913242 20.05408802;
       34.96420248 19.22137637;
       38.02378205 22.43662335;
       39.82473002 26.74046848;
       40.73155212 30.64733293;
       40.78231467 31.47762269;
       43.65045117 29.52402098;
       43.98431659 31.22592878;
       45.85007353 39.96229154;
       45.86560068 41.02424889;
       46.84099885 41.69664734;
       50.92001057 59.1621072;
       51.67576465 63.30306113;
       52.11154682 58.76770452;
       52.90146957 70.52866272;
       54.62597909 59.0384346;
       54.84455645 63.42155099;
       56.4281467  66.0672385;
       56.81264413 71.23205069;
       58.71374467 63.89488596;
       58.76263484 75.16329017;
       59.34177555 61.94193544;
       59.6773828  55.83834343;
       59.8456116  64.7025714;
       60.14855328 61.64794985;
       60.7377122  64.96103591;
       61.67031839 67.98982394;
       61.69555794 64.43296083;
       61.7209504  71.45272834;
       62.69027273 71.70957826;
       63.72170366 76.21425758;
       64.63039814 69.68300758;
       66.5899707  71.62804124;
       67.05748226 69.26277138;
       68.67293245 71.44593101;
       68.75527149 63.8696769;
       71.05787734 60.21901119;
       71.87815694 60.84846677;
       73.11570773 47.75190416;
       73.67113434 61.96563256;
       73.75832957 52.07996822;
       75.56681177 41.04984609;
       75.74799789 48.15872853;
       77.43039052 39.07106206;
       79.55640535 31.26733296;
       80.23792151 43.5386057;
       80.91495077 37.01219949;
       81.32656012 28.18203412;
       81.49587801 42.40383548;
       81.55998953 33.58093579;
       83.39739255 40.3780721;
       83.41437807 25.69051366;
       83.4473271  30.58555917;
       83.47163047 32.24775329;
       85.49681764 36.03886199;
       86.23634712 25.86244125;
       86.33192693 24.4748576;
       86.54699828 31.25972833;
       87.32448589 34.24557349;
       87.50011837 30.40844884;
       88.31852559 41.47601887;
       89.48072702 17.94295641;
       91.29733269 20.67614425;
       91.47054824 24.59834735;
       92.21563138 25.3679337;
       92.27127249 37.09805849;
       94.37121976 22.22838982;
       94.51176974 29.19956338]; 
units.aJO   = {'d', 'ml/d'};  label.aJO = {'age', 'O_2 consumption'};  
temp.aJO    = C2K(30);  units.temp.aJO = 'K'; label.temp.aJO = 'temperature';
bibkey.aJO = 'WebbChoq1986';

%% set weights for all real data
weights = setweights(data, []);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Since egg size is very sensitive to environmental conditions, initial egg size is a free parameter to fit embryo data';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Males develop from eggs incubated below 31.5 C, females above 32.5 C';
metaData.bibkey.F1 = 'ADW';
F2 = 'Males are slightly smaller than females'; 
metaData.bibkey.F2 = 'arkive';
F3 = 'Hatching is delayed till rain or flooding, which usually is at the start of the wet season';
metaData.bibkey.F3 = 'arkive';
F4 = 'An adult''s size depends on its habitat, with individuals near the coast being much larger than those near rivers';
metaData.bibkey.F4 = 'ADW';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'R7VH'; % Cat of Life
metaData.links.id_ITIS = '208726'; % ITIS
metaData.links.id_EoL = '1056984'; % Ency of Life
metaData.links.id_Wiki = 'Carettochelys_insculpta'; % Wikipedia
metaData.links.id_ADW = 'Carettochelys_insculpta'; % ADW
metaData.links.id_Taxo = '48380'; % Taxonomicon
metaData.links.id_WoRMS = '1389958'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Carettochelys&species=insculpta'; % ReptileDB
metaData.links.id_AnAge = 'Carettochelys_insculpta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carettochelys_insculpta}}';
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
bibkey = 'WebbChoq1986'; type = 'Article'; bib = [ ... 
'author = {Webb, G. J. W. and Choqeunot, D. and Whitehead, P. J.}, ' ... 
'year = {1986}, ' ...
'title = {Nests, eggs, and embryonic development of \emph{Carettochelys insculpta} ({C}helonia: {C}arettochelidae) from {N}orthern {A}ustralia.}, ' ...
'journal = {J. Zool. (Lond.) B}, ' ...
'volume = {1}, ' ...
'pages = {521--550}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DoodGeor2003'; type = 'Article'; bib = [ ... 
'author = {J. S. Doody and A. Georges and J. E. Young}, ' ... 
'year = {2003}, ' ...
'title = {Twice every second year: reproduction in the pig-nosed turtle, \emph{Carettochelys insculpta}, in the wet-dry tropics of {A}ustralia}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {259}, ' ...
'pages = {179--188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Carettochelys_insculpta/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/pig-nosed-turtle/carettochelys-insculpta/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
