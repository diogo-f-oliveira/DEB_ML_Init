function [data, auxData, metaData, txtData, weights] = mydata_Acroperus_harpae
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Acroperus_harpae'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TH','TN','TA','TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ap'; 'T-am'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 02]; 

%% set data
% zero-variate data

data.ab = 4.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Bott1975';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on moult interval of 7 d';

data.Lb  = 0.034; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.080; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'Bott1975','KlemAase2020'};
  comment.tp = 'based on Ttp and tL data';
data.Li  = 0.13;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';
data.Lim  = 0.09;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'nina';

data.Wdp  = 3.29e-6;  units.Wdp  = 'g';  label.Wdp  = 'dry weight at puberty';   bibkey.Wdp  = 'Bott1975';

data.Ri = 1.5/7;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Bott1975';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 1.5 egg per brood, 7 d per moult (9 d at 10 C, 5.12 d at 15 C)';

% uni-variate data
% time-length
data.tL = [ ... % time since june 12 (d), length (mm)
0.079	0.382
17.889	0.559
28.313	0.683
42.124	0.729
57.444	0.757
72.757	0.749
85.240	0.776
97.713	0.750
121.344	0.741];
data.tL(:,1) = data.tL(:,1) + 2; % set origin at birth
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KlemAase2020'; 
comment.tL = 'data from Takvatn, a 15 km 2 north Norwegian';

% temperature-time since birth at puberty
data.Ttp = [ ... % temperature (C), time since birth at puberty (d)
    5 0.59*119
   10 0.51*74
   15 0.54*45
   20 0.53*29];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'Bott1975';     

% temperature-time since birth at puberty
data.Tam = [ ... % temperature (C), life span (d)
    5 119
   10  74
   15  45
   20  29];
units.Tam   = {'C', 'd'};  label.Tam = {'temperature', 'mean life span'};  
bibkey.Tam = 'Bott1975';     

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; 

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
metaData.links.id_CoL = '9NN6'; % Cat of Life
metaData.links.id_ITIS = '84023'; % ITIS
metaData.links.id_EoL = '46498229'; % Ency of Life
metaData.links.id_Wiki = 'Acroperus'; % Wikipedia
metaData.links.id_ADW = 'Acroperus_harpae'; % ADW
metaData.links.id_Taxo = '156207'; % Taxonomicon
metaData.links.id_WoRMS = '148407'; % WoRMS

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nina.no/archive/nina/pppbasepdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Acroperus%%20harpae.pdf}}';
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
bibkey = 'KlemAase2020'; type = 'Article'; bib = [ ... 
'doi = {10.1093/jcbiol/ruaa048}, ' ...
'author = {Anders Klemetsen and Berit M. Aase and Per-Arne Amundsen}, ' ... 
'year = {2020}, ' ...
'title = {Diversity, abundance, and life histories of littoral chydorids ({C}ladocera: {C}hydoridae) in a subarctic {E}uropean lake}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {40(5)}, ' ...
'pages = {534–543}'];
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
