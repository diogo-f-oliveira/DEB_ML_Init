function [data, auxData, metaData, txtData, weights] = mydata_Sida_crystallina
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Sida_crystallina'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'Lb'; 'Lp'; 'Li'; 'Wdp'; 'Ri'}; 
metaData.data_1     = {'T-ap'; 'T-am'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 04]; 

%% set data
% zero-variate data

data.ab = 4.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Bott1975';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on moult interval of 3.9 d';

data.Lb  = 0.034; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.25;  units.Lp  = 'cm';  label.Lp  = 'ultimate total length';   bibkey.Lp  = 'guess';
data.Li  = 0.40;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';
data.Lim  = 0.22;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'nina';

data.Wdp  = 31.16e-6;  units.Wdp  = 'g';  label.Wdp  = 'dry weight at puberty';   bibkey.Wdp  = 'Bott1975';

data.Ri = 5/3.9;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Bott1975';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 5 egg per brood, 3.9 d per moult';

% uni-variate data

% temperature-time since birth at puberty
data.Ttp = [ ... % temperature (C), time since birth at puberty (d)
   10 0.65*74
   15 0.43*60
   20 0.40*40];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'Bott1975';     

% temperature-time since birth at puberty
data.Tam = [ ... % temperature (C), life span (d)
   10  74
   15  60
   20  40];
units.Tam   = {'C', 'd'};  label.Tam = {'temperature', 'mean life span'};  
bibkey.Tam = 'Bott1975';     

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

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4X7TZ'; % Cat of Life
metaData.links.id_ITIS = '83863'; % ITIS
metaData.links.id_EoL = '46498303'; % Ency of Life
metaData.links.id_Wiki = 'Sida_crystallina'; % Wikipedia
metaData.links.id_ADW = 'Sida_crystallina'; % ADW
metaData.links.id_Taxo = '33090'; % Taxonomicon
metaData.links.id_WoRMS = '410029'; % WoRMS

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Sida%%20crystallina.pdf}}';
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
bibkey = 'Bott1975'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00369097}, ' ...
'author = {Howard H. Bottrell}, ' ... 
'year = {1975}, ' ...
'title = {Generation time, length of life, instar duration and frequency of moulting, and their relationship to temperature in eight species of cladocera from the {R}iver {T}hames, {R}eading}, ' ...
'journal = {Oecologia (Berl.)}, ' ...
'volume = {19(2)}, ' ...
'pages = {129–140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
