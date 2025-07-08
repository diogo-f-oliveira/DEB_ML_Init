function [data, auxData, metaData, txtData, weights] = mydata_Neotamias_panamintinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Neotamias_panamintinus'; 
metaData.species_en = 'Panamint chipmunk'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 01]; 

%% set data
% zero-variate data

data.tg = 36;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'HirsBrad1977';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'HirsBrad1977';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 305;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'ADW';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'likely to be an over estimate';

data.Li = 11.53;   units.Li = 'cm';   label.Li = 'ultimate head_body length';     bibkey.Li = 'HirsBrad1977';
  
data.Wwi = 105;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 3.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HirsBrad1977';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 3.8 pups per litter; ADW gives 4-6 pups per litter';

% uni-variate data
% time - length
data.tL = [ ... % time (d), head+body length (cm)
    1  4.97
    2  5.14
    3  5.53
    4  6.14
    5  6.65
    6  6.51
    7  8.34
    8  9.20
    9  9.62
   10 10.29
   11 11.09
   12 11.49
   13 11.63];
data.tL(:,1) = 7 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head+body length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HirsBrad1977';

% time-weight data
data.tWw = [ ... % time (wk), weight (g)
    1  5.80
    2  7.54
    3  8.39
    4 11.58
    5 14.84
    6 17.68
    7 23.64
    8 30.20
    9 37.50
   10 40.94
   11 44.26
   12 46.02
   13 47.78];
data.tWw(:,1) = 7 * data.tWw(:,1);
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'HirsBrad1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;
weights.Li = 0 * weights.Li;

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
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WYZC'; % Cat of Life
metaData.links.id_ITIS = '180199'; % ITIS
metaData.links.id_EoL = '311567'; % Ency of Life
metaData.links.id_Wiki = 'Neotamias_panamintinus'; % Wikipedia
metaData.links.id_ADW = 'Tamias_panamintinus'; % ADW
metaData.links.id_Taxo = '61951'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401195'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neotamias_panamintinus}}';
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
bibkey = 'HirsBrad1977'; type = 'Article'; bib = [ ... 
'author = {Joseph R. Hirshfeld and W. Glen Bradley}, ' ... 
'year = {1977}, ' ...
'title = {Growth and Development of Two Species of Chipmunks: \emph{Eutamias panamintinus} and \emph{E. palmeri}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {58(1)}, ' ...
'pages = {44-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Tamias_panamintinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

