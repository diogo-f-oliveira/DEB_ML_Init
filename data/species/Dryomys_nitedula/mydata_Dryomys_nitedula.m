function [data, auxData, metaData, txtData, weights] = mydata_Dryomys_nitedula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Gliridae';
metaData.species    = 'Dryomys_nitedula'; 
metaData.species_en = 'Forest dormouse'; 

metaData.ecoCode.climate = {'BSk','BWk','Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiC','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 24]; 

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.1*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 1.73;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 56;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Jusk2014e';
  comment.Wwi = 'Jusk2014e gives 54.5 g for female, 57.7 g for male; in Mongonia even heavier';

data.Ri  = 1.2*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 litter per yr, 3 pups per litter';

% uni-variate data

% time-weight data
data.tWw = [ ... % time (d), weight (g)
0.000	12.166
14.387	13.060
28.154	15.646
42.137	20.408
56.941	25.047
70.322	32.468];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(37.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Jusk2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
D2 = 'Food availability is assumed to be initially lower';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '37VFG'; % Cat of Life
metaData.links.id_ITIS = '584967'; % ITIS
metaData.links.id_EoL = '327933'; % Ency of Life
metaData.links.id_Wiki = 'Dryomys_nitedula'; % Wikipedia
metaData.links.id_ADW = 'Dryomys_nitedula'; % ADW
metaData.links.id_Taxo = '63266'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12500027'; % MSW3
metaData.links.id_AnAge = 'Dryomys_nitedula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dryomys_nitedula}}';
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
bibkey = 'Jusk2014'; type = 'Article'; bib = [ ... 
'doi = {DOI 10.1515/mammalia-2013-0165       }, ' ...
'author = {Rimvydas Ju\v{s}kaitis}, ' ... 
'year = {2014}, ' ...
'title = {Ecology of the forest dormouse \emph{Dryomys nitedula} {P}allas 1778) on the north-western edge of its distributional range}, ' ...
'journal = {Mammalia}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Dryomys_nitedula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Dryomys_nitedula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
