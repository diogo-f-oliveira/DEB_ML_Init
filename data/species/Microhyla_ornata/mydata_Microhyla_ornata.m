function [data, auxData, metaData, txtData, weights] = mydata_Microhyla_ornata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Microhylidae';
metaData.species    = 'Microhyla_ornata'; 
metaData.species_en = 'Ornate narrow-mouthed frog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0jFp', 'jiTg', 'jiTh'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 14];

%% set data
% zero-variate data

data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'KumbPanc2001';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;  units.tpm = 'd';    label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'KumbPanc2001';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'KumbPanc2001';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li  = 2.8;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'Wiki';
data.Lim  = 2.4; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'Wiki';

data.Wwb = 1e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Hyla exima';
data.Wwi = 1.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'KumbPanc2001';
data.Wwim = 1.3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'KumbPanc2001';

data.Ri  = 150/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), SVL (cm): females, males
   0 NaN 2.0
   0 NaN 2.0
   1 2.1 2.3
   1 NaN 2.5
   1 NaN 2.1
   1 NaN 2.0
   2 2.4 2.0
   2 NaN 2.5
   2 NaN 2.1
   2 NaN 2.2
   3 2.2 2.3
   3 2.5 2.2
   3 2.8 2.4
   3 NaN 2.5
   3 NaN 2.5
   3 NaN 2.2
   4 2.5 2.1
   4 NaN 2.3
   4 NaN 2.2];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert LAG to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm   = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_fm = 'KumbPanc2001'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

% length-weight
data.LW_f = [ ... % time since birth (yr), weight (g)
   2.1 0.8
   2.4 1.4
   2.2 1.2
   2.5 1.5
   2.8 1.7
   2.5 1.6];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight'};  
bibkey.LW_f = 'KumbPanc2001'; comment.LW_f = 'data for females';
%
data.LW_m = [ ... % time since birth (yr), weight (g)
   2.0 0.8
   2.0 0.8
   2.3 1.0
   2.5 0.6
   2.1 1.0
   2.0 0.9
   2.0 0.8
   2.5 1.0
   2.1 1.0
   2.2 1.0
   2.3 1.0
   2.2 1.2
   2.4 1.0
   2.5 1.0
   2.5 1.0
   2.2 1.0
   2.1 1.1
   2.3 1.3
   2.2 1.1];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight'};  
bibkey.LW_m = 'KumbPanc2001'; comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '42XBB'; % Cat of Life
metaData.links.id_ITIS = '1103106'; % ITIS
metaData.links.id_EoL = '1047320'; % Ency of Life
metaData.links.id_Wiki = 'Microhyla_ornata'; % Wikipedia
metaData.links.id_ADW = 'Microhyla_ornata'; % ADW
metaData.links.id_Taxo = '142389'; % Taxonomicon
metaData.links.id_WoRMS = '1600409'; % WoRMS
metaData.links.id_amphweb = 'Microhyla+ornata'; % AmphibiaWeb
metaData.links.id_AnAge = 'Microhyla_ornata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microhyla_ornata}}';
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
bibkey = 'KumbPanc2001'; type = 'Article'; bib = [ ... 
'author = {Suresh M. Kumbar and Katti Pancharatna}, ' ... 
'year = {2001}, ' ...
'title = {Determination of age, longevity and age at reproduction of the frog \emph{Microhyla ornata} by skeletochronology}, ' ...
'journal = {J. Biosci. (Indian Acad Sci)}, ' ...
'volume = {26(2)}, ' ...
'pages = {265–270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Microhyla+ornata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Microhyla_ornata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

