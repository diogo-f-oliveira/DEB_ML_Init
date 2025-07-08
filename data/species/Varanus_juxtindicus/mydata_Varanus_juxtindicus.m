function [data, auxData, metaData, txtData, weights] = mydata_Varanus_juxtindicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Varanidae';
metaData.species    = 'Varanus_juxtindicus'; 
metaData.species_en = 'Rennell Island monitor'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 06 11];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 11];


%% set data
% zero-variate data

data.ab = 174;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'WesiKoch2009';   
  temp.ab = C2K(28.5);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(28.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Varanus prasinus';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Varanus prasinus';

data.Lb  = 11.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'WesiKoch2009'; 
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Wiki';
  comment.Li = 'TL 150 cm, converted to SVL as SVL = TL * 0.4';

data.Wwb = 24;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'WesiKoch2009';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Li = 'based on V. indicus, which is very simiar';
 
% uni-variate data
% time-length
data.tL = [ ... % time since brith (d), SVL (cm)
1.458	11.511
30.205	12.835
60.374	14.453
90.079	16.293
120.693	17.138
150.370	18.093
180.509	18.753
209.716	19.745
239.865	20.737
270.003	21.398
300.152	22.390
330.300	23.345
360.438	24.005];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WesiKoch2009';

% time-weight
data.tW = [ ... % time since brith (d), weight (g)
0.000	24.340
29.662	35.456
59.772	51.440
89.459	73.753
119.169	81.948
149.284	95.498
180.218	112.453
208.257	132.336
237.947	152.215
269.278	178.906
298.553	200.246
329.490	215.741
359.596	233.671];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WesiKoch2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Capable of being parthenogenetic';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Males and females have equal length, but females are 9 percent heavier';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7FG7V'; % Cat of Life
metaData.links.id_ITIS = '716519'; % ITIS
metaData.links.id_EoL = '790076'; % Ency of Life
metaData.links.id_Wiki = 'Varanus_juxtindicus'; % Wikipedia
metaData.links.id_ADW = 'Varanus_juxtindicus'; % ADW
metaData.links.id_Taxo = '644080'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Varanus&species=juxtindicus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varanus_juxtindicus}}';
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
bibkey = 'WesiKoch2009'; type = 'Article'; bib = [ ... 
'author = {Klaus Wesiaki and Anfr\''{e} Koch}, ' ... 
'year = {2009}, ' ...
'title = {Successful Husbandry and First Breeding of \emph{Varanus juxtindicus} {B}\"{o}hme et al., 2002, with Remarks on the Development of Juveniles of this ''Rarely-Kept'' Endemic {S}olomon Monitor Species}, ' ...
'journal = {Biawak}, ' ...
'volume = {3(4)}, ' ...
'pages = {106-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Varanus_prasinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

