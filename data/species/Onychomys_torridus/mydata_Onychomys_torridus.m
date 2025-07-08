function [data, auxData, metaData, txtData, weights] = mydata_Onychomys_torridus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Onychomys_torridus'; 
metaData.species_en = 'Southern grasshopper mouse'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 41;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.6*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data is uncertain';

data.Wwb = 2.6;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 9.2;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 22;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.7*2.7/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.7 pups per litter; 2.7 litter per yr';
  
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (wk), weight (g)
    2  7.6
    3  8.7
    4 12.6
    5 15.5
    6 17.2
    7 18.4
    8 18.8
    9 19.8
   10 19.8
   11 19.8
   12 19.7
   13 19.6
   14 19.7
   15 19.6
   16 20.0
   17 20.0
   18 19.7];
data.tWw_f(:,1) = 7 * data.tWw_f(:,1); % convert wk to d
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Pint1970';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (wk), weight (g)
    2  7.7
    3  8.7
    4 12.6
    5 15.8
    6 17.6
    7 19.3
    8 19.6
    9 20.7
   10 20.2
   11 20.6
   12 20.4
   13 20.3
   14 21.4
   15 21.4
   16 21.5
   17 21.8
   18 21.8];
data.tWw_m(:,1) = 7 * data.tWw_m(:,1); % convert wk to d
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Pint1970';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.Wwx = 5 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '49RD6'; % Cat of Life
metaData.links.id_ITIS = '180383'; % ITIS
metaData.links.id_EoL = '328464'; % Ency of Life
metaData.links.id_Wiki = 'Onychomys_torridus'; % Wikipedia
metaData.links.id_ADW = 'Onychomys_torridus'; % ADW
metaData.links.id_Taxo = '62349'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000433'; % MSW3
metaData.links.id_AnAge = 'Onychomys_torridus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychomys_torridus}}';
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
bibkey = 'Pint1970'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1378473}, ' ...
'author = {Pinter, A. J.}, ' ... 
'year = {1970}, ' ...
'title = {Reproduction and Growth for Two Species of Grasshopper Mice (\emph{Onychomys}) in the Laboratory}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {51(2)}, ' ...
'pages = {236–243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Onychomys_torridus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

