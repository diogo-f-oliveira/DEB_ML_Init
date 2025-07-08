function [data, auxData, metaData, txtData, weights] = mydata_Cebus_albifrons

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cebidae';
metaData.species    = 'Cebus_albifrons'; 
metaData.species_en = 'Humboldt''s white-fronted capuchin'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-dWw'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 27]; 


%% set data
% zero-variate data

data.tg = 158;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 274;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1310;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 37.5;    units.Li  = 'cm';  label.Li  = 'ultimate body length';    bibkey.Li  = 'Wiki';

data.Wwb = 233;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 2230;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
data.Wwim = 2400;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';

data.Ri  = 0.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 0.7 litters per yr';

% univariate data
% time-weight
data.tdWw = [ ... % time since birth (mnth), change in weight (kg/yr)
   1.5 1.16
   4.5 0.64 
   7.5 0.23
  10.5 0.48
  13.5 0.65 
  16.5 0.37 
  19.5 0.32 
  22.5 0.32 
  25.5 0.32
  28.5 0.23
  31.5 0.30 
  34.5 0.25 
  37.5 0.17 
  40.5 0.11 
  43.5 0.12 
  46.5 0.20 
  49.5 0.17];
data.tdWw(:,1) = 30.5 *  data.tdWw(:,1); % convert mnth to d
data.tdWw(:,2) = data.tdWw(:,2) * 1000/365; % convert kg/yr to g/d
units.tdWw  = {'d', 'g/d'}; label.tdWw = {'time sinc birth', 'change in wet weight'};  
temp.tdWw   = C2K(38.5);  units.temp.tdWw = 'K'; label.temp.tdWw = 'temperature';
bibkey.tdWw = 'WileNaft1978';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'RYYS'; % Cat of Life
metaData.links.id_ITIS = '572975'; % ITIS
metaData.links.id_EoL = '323942'; % Ency of Life
metaData.links.id_Wiki = 'Cebus_albifrons'; % Wikipedia
metaData.links.id_ADW = 'Cebus_albifrons'; % ADW
metaData.links.id_Taxo = '65742'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100256'; % MSW3
metaData.links.id_AnAge = 'Cebus_albifrons'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cebus_albifrons}}';
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
bibkey = 'WileNaft1978'; type = 'Article'; bib = [ ... 
'author = {Wilen, R. and Naftolin, F.}, ' ... 
'year = {1978}, ' ...
'title = {Pubertal age, weight, and weight gain in the individual female new world monkey (\emph{Cebus albifrons})}, ' ...
'journal = {Primates}, ' ...
'volume = {19(4)}, ' ...
'doi = {10.1007/bf02373644}, '...
'pages = {769–773}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cebus_albifrons}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Cebus_albifrons/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

