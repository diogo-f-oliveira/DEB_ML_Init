function [data, auxData, metaData, txtData, weights] = mydata_Elaphurus_davidianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Elaphurus_davidianus'; 
metaData.species_en = 'Pere David''s deer'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 07 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 21]; 

%% set data
% zero-variate data

data.tg = 288;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 167;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 821;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1186;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';   
  temp.tpm = C2K(38.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27.5*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 11e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 160e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'DahlDawe2013';
data.Wwim = 186.5e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time  since birth (yr),  weight (g)
    1 105.1e3
    2 162.2e3
    3 159.3e3
    4 161.5e3
    5 158.0e3]; 
data.tWw_f(:,1) = data.tWw_f(:,1) * 365;
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(38.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'DahlDawe2013';
comment.tWw_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 10 * weights.tWw_f;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '394B6'; % Cat of Life
metaData.links.id_ITIS = '625053'; % ITIS
metaData.links.id_EoL = '308403'; % Ency of Life
metaData.links.id_Wiki = 'Elaphurus_davidianus'; % Wikipedia
metaData.links.id_ADW = 'Elaphurus_davidianus'; % ADW
metaData.links.id_Taxo = '68014'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200399'; % MSW3
metaData.links.id_AnAge = 'Elaphurus_davidianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elaphurus_davidianus}}';
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
bibkey = 'ZhonZhan2008'; type = 'Article'; bib = [ ... 
'author = {Zhong, Zhen-yu and Zhang, Lin-yuan and Xia, Jing-shi and Li, Kun}, ' ... 
'year = {2008}, ' ...
'title = {Growth of Different-aged Female Milu (\emph{Elaphurus davidianus})}, ' ...
'journal = {Sichuan Journal of Zoology}, ' ...
'volume = {27(5)}, ' ...
'pages = {907-909}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Elaphurus_davidianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

