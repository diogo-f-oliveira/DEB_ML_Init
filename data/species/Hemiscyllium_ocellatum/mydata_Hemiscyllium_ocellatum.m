function [data, auxData, metaData, txtData, weights] = mydata_Hemiscyllium_ocellatum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Hemiscylliidae';
metaData.species    = 'Hemiscyllium_ocellatum'; 
metaData.species_en = 'Epaulette shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMr', '0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2012 07 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data;
data.ab = 140.3;     units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'PaynRufo2012';    
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '134 till 148 d';
data.tp = 4*365;   units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'PaynRufo2012';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;  units.am = 'd';   label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16.9; units.Lb  = 'cm'; label.Lb  = 'total length at birth';  bibkey.Lb  = 'PaynRufo2012';
data.Li  = 107;     units.Li = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb  = 15;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';        bibkey.Wwb  = 'PaynRufo2012';
data.Wwi  = 3957;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'PaynRufo2012';
  comment.Wwi = 'based on tL, tW and Li data: 69.4*(107/27.8)^3';

data.Ri  = 78/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'PaynRufo2012';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tW = [ ... % time since birth (d), wet weight (g)
95.602	27.058
104.107	27.539
167.824	37.069
261.267	51.790
280.338	58.435
323.470	69.426];
units.tW = {'d', 'g'}; label.tW = {'time since hatch', 'weight'};  
temp.tW = C2K(25); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PaynRufo2012';
%
data.tL = [ ... % time since birth (d), total length (cm)
46.814	18.262
82.581	20.083
88.079	20.274
96.311	20.247
104.553	20.437
163.641	22.122
262.604	25.466
281.186	26.635
327.215	27.858];
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PaynRufo2012';

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

%% Links
metaData.links.id_CoL = '3KSHX'; % Cat of Life
metaData.links.id_ITIS = '159936'; % ITIS
metaData.links.id_EoL = '46559719'; % Ency of Life
metaData.links.id_Wiki = 'Hemiscyllium_ocellatum'; % Wikipedia
metaData.links.id_ADW = 'Hemiscyllium_ocellatum'; % ADW
metaData.links.id_Taxo = '94275'; % Taxonomicon
metaData.links.id_WoRMS = '281037'; % WoRMS
metaData.links.id_fishbase = 'Hemiscyllium-ocellatum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemiscyllium_ocellatum}}';  
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
bibkey = 'PaynRufo2012'; type = 'Article'; bib = [ ...
'author = {E. J. Payne and K. S. Rufo}, ' ...
'year = {2012}, ' ...
'title = {Husbandry and Growth Rates of Neonate Epaulette Sharks, \emph{Hemiscyllium ocellatum} in Captivity}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {31}, '...
'pages = {718-724}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/hemiscyllium-ocellatum}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
