function [data, auxData, metaData, txtData, weights] = mydata_Pelea_capreolus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Pelea_capreolus'; 
metaData.species_en = 'Grey rhebok'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 07 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 21]; 

%% set data
% zero-variate data

data.tg = 257;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'Furs2011';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '245 - 261 d';
data.tx = 4*30.5;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Furs2011';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 473;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Furs2011';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on 2 yr - tg';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 72.3;   units.Li = 'cm';   label.Li = 'ultimate shoulder height for females';   bibkey.Li = 'Furs2011';
data.Lim = 77.6; units.Lim = 'cm';   label.Lim = 'ultimate shoulder height for males';   bibkey.Lim = 'Furs2011';

data.Wwb = 3.8e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on size-corrected value for Wwim: 30e3*(39/77.6)^3';
data.Wwi = 24.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Wwim: 30e3*(72.3/77.6)^3';
data.Wwim = 30e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (mnth), shoulder heigth (cm)
  30  43.4
  91  49.2 
 274  56.8
 365  63.0
 549  69.9
 730  73.9
 912  76.5
1277  77.6];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shoulder height'};  
temp.tL    = C2K(36.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Furs2011';
comment.tL = 'Data for male';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '75Z6V'; % Cat of Life
metaData.links.id_ITIS = '625182'; % ITIS
metaData.links.id_EoL = '331081'; % Ency of Life
metaData.links.id_Wiki = 'Pelea_capreolus'; % Wikipedia
metaData.links.id_ADW = 'Pelea_capreolus'; % ADW
metaData.links.id_Taxo = '68337'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200994'; % MSW3
metaData.links.id_AnAge = 'Pelea_capreolus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelea_capreolus}}';
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
bibkey = 'Furs2011'; type = 'article'; bib = [ ... 
'author = {Furstenburg, D.}, ' ... 
'year = {2011}, ' ...
'title = {Focus on the grey rhebok (\emph{Pelea capreolus})}, ' ...
'journal = {S A Hunter}, ' ...
'volume = {09056}, '...
'pages = {54-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelea_capreolus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

