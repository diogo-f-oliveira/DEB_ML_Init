function [data, auxData, metaData, txtData, weights] = mydata_Loris_tardigradus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lorisidae';
metaData.species    = 'Loris_tardigradus'; 
metaData.species_en = 'Slender loris'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2018 08 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 10]; 


%% set data
% zero-variate data

data.tg = 166;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 150;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 380;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.5*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = '15-25 cm';

data.Wwb = 11;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 139;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 238.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.5*1.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
%time - weight
data.tW = [ ... % time since birth (d), weight (g)
  5  12.8
  6  12.9
 15  15.6
 17  16.15
 20  18.4
 21  18.5
 22  18.9
 23  20
 24  20.7
 25  21.5
 28  22.9
 30  24.3
 31  25
 32  27.3
 35  27.8
 36  26.8
 37  27.7
 39  30.5
 40  29.6
 41  32.4
 42  32.9
 43  35.3
 44  36.5
 45  36.5
 48  40.5
 49  39.5
 50  40.5
 51  42.4
 52  44.2
 53  46
 54  46.7
 56  50.9
 57  52.7
 58  52.9
 59  55.8
 60  56.6
 62  59.6
 63  60.4
 64  62.5
 65  65.4
 67  70.2
 68  73.6
 69  66
 70  72.1
 71  72.9
 72  73.3
 73  73.1
 74  75.8
 75  79.9
 77  81.6
 78  82.1
 79  83.8
 80  84.9
 82  87.8
 84  90.9
 85  93.3
 87  94.5
 88  95
 89 102.2
 91 106.7
 92 106
 93 105.1
 94 109.2
 96 112.7
 97 108.9
 98 112.6
100 113.6
101 118
103 114.5
105 128.8
110 130.8
111 126.6
114 134.5
117 122.5
121 142.3
126 141.5
129 142.5
134 152.5
141 156.5
163 165.4];
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Chri1992';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: tW data added';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3W7FX'; % Cat of Life
metaData.links.id_ITIS = '572889'; % ITIS
metaData.links.id_EoL = '326537'; % Ency of Life
metaData.links.id_Wiki = 'Loris_tardigradus'; % Wikipedia
metaData.links.id_ADW = 'Loris_tardigradus'; % ADW
metaData.links.id_Taxo = '65539'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100111'; % MSW3
metaData.links.id_AnAge = 'Loris_tardigradus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Loris_tardigradus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Loris_tardigradus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chri1992'; type = 'Article'; bib = [ ... 
'author = {S. Christie}, ' ... 
'year = {1992}, ' ...
'title = {Hand-rearing a slender loris at \emph{Loris tardigradus nordicus} {London Zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {31}, ' ...
'pages = {157--163}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

