function [data, auxData, metaData, txtData, weights] = mydata_Lithobates_septentrionalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Lithobates_septentrionalis'; 
metaData.species_en = 'Mink frog'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 16];

%% set data
% zero-variate data

data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'LeclLaur1996';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'LeclLaur1996';   
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.8;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'LeclLaur1996';
data.Lpm  = 5.9;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'LeclLaur1996';
data.Li  = 7.6;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';

data.Wwb = 4.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 48.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 22.9 g for SVL 5.91: (7.6/5.91)^3*22.9';

data.Ri  = 2250/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: fecundity: 500-4000 eggs';
  
% univariate data
% time-length
data.tL_Afm = [ ... % time since birth (d), SVL (cm)
0.5	4.027 3.999
1	4.914 4.664
2	6.625 6.079
3	7.049 6.317];
data.tL_Afm(:,1) = data.tL_Afm(:,1)*365; % convert yr to d
units.tL_Afm  = {'d', 'cm'};  label.tL_Afm = {'time since birth', 'SVL'};  
temp.tL_Afm   = C2K(15);  units.temp.tL_Afm = 'K'; label.temp.tL_Afm = 'temperature';
bibkey.tL_Afm = 'LeclLaur1996'; treat.tL_Afm = {1,'females','males'};
subtitle.tL_Afm = 'data from Ashuapmushuan, Quebec';
comment.tL_Afm = 'data from Ashuapmushuan, Quebec';
%
data.tL_Mfm = [ ... % time since birth (d), SVL (cm)
0.5	3.304 3.304
1	4.146 3.304
2	5.847 4.155
3	6.558 5.282
4	7.018 NaN];
data.tL_Mfm(:,1) = data.tL_Mfm(:,1)*365; % convert yr to d
units.tL_Mfm  = {'d', 'cm'};  label.tL_Mfm = {'time since birth', 'SVL'};  
temp.tL_Mfm   = C2K(10);  units.temp.tL_Mfm = 'K'; label.temp.tL_Mfm = 'temperature';
bibkey.tL_Mfm = 'LeclLaur1996'; treat.tL_Mfm = {1,'females','males'};
subtitle.tL_Mfm = 'data from Mastigouche, Quebec';
comment.tL_Mfm = 'data from Mastigouche, Quebec'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Afm = 5 * weights.tL_Afm;
weights.tL_Mfm = 5 * weights.tL_Mfm;
weights.Lp = 0 * weights.Lp;
weights.Lpm = 0 * weights.Lpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.subtitle = subtitle;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VHQT'; % Cat of Life
metaData.links.id_ITIS = '775112'; % ITIS
metaData.links.id_EoL = '332452'; % Ency of Life
metaData.links.id_Wiki = 'Lithobates_septentrionalis'; % Wikipedia
metaData.links.id_ADW = 'Lithobates_septentrionalis'; % ADW
metaData.links.id_Taxo = '996579'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+septentrionalis'; % AmphibiaWeb
metaData.links.id_AnAge = 'Lithobates_septentrionalis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithobates_septentrionalis}}';
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
bibkey = 'LeclLaur1996'; type = 'Article'; bib = [ ... 
'author = {Raymond Leclair and Genevieve Laurin}, ' ... 
'year = {1996}, ' ...
'title = {Growth and body size in populations of mink frogs \emph{Rana septentrionalis} from two latitudes}, ' ...
'journal = {Ecography}, ' ...
'volume = {19}, ' ...
'pages = {296-304}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+septentrionalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lithobates_septentrionalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lithobates_septentrionalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

