function [data, auxData, metaData, txtData, weights] = mydata_Liparis_gibbus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Liparis_gibbus'; 
metaData.species_en = 'Variegated snailfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MAN','MN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 28];

%% set data
% zero-variate data

data.ab = 55;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(-0.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(-0.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 8 yrs, but length is then much smaller than Li';

data.Lp  = 4.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'FalkPete1988'; 
data.Li  = 52; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.092; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 5.6 mm: pi/6*0.56^3';
data.Wwp = 0.98;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','FalkPete1988'};
  comment.Wwp = 'based on 0.01148*Lp^3.05, see F1';
data.Wwi = 1967;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.05, see F1';
 
data.Ri  = 500/365; units.Ri  = '#/d';label.Ri  = 'reprod rate at Lw = 200 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(-0.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
1    NaN   10.199
2	 9.412 13.546
3	10.824 11.633
4	12.078 13.307
5	14.745 14.900
6	15.216 20.398];	
data.tL_fm(:,1) = (data.tL_fm(:,1)+0)*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(-0.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'FalkPete1988'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01148*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Often found in empty scallop shells';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3V9LN'; % Cat of Life
metaData.links.id_ITIS = '167561'; % ITIS
metaData.links.id_EoL = '46569427'; % Ency of Life
metaData.links.id_Wiki = 'Liparis_gibbus'; % Wikipedia
metaData.links.id_ADW = 'Liparis_gibbus'; % ADW
metaData.links.id_Taxo = '178950'; % Taxonomicon
metaData.links.id_WoRMS = '159526'; % WoRMS
metaData.links.id_fishbase = 'Liparis-gibbus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liparis_gibbus}}';
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
bibkey = 'FalkPete1988'; type = 'article'; bib = [ ... 
'doi = {10.1007/bf00442026}, ' ...
'author = {Falk-Petersen, I. B. and Frivoll, V. and Gulliksen, B., and Haug, T. and Vader, W.}, ' ... 
'year = {1988}, ' ...
'title = {Age/size relations and food of two snailfishes, \emph{Liparis gibbus} and \emph{Careproctus reinhardii} ({T}eleostei, {L}iparididae) from {S}pitsbergen coastal waters}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {8(5)}, ' ...
'pages = {353–358}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Liparis-gibbus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
