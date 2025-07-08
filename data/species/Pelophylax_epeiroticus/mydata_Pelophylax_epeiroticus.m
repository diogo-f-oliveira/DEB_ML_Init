function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_epeiroticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_epeiroticus'; 
metaData.species_en = 'Epirus water frog'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFl', 'jiTh'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 17];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Pelophylax_ridibundus';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'TsioKyri2002';
  temp.tp = C2K(16);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males';  bibkey.tpm = 'TsioKyri2002';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 11*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Pelophylax_ridibundus';

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';     bibkey.Lj  = 'gueaa'; 
  comment.Lj = 'based on Pelophylax_ridibundus';
data.Lp  = 7.5;  units.Lp  = 'cm';  label.Lp  = 'ultimate SVL for females'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Pelophylax_ridibundus';
data.Li  = 11.0; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'TsioKyri2002';
data.Lim = 8.8; units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';   bibkey.Lim = 'TsioKyri2002';

data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 2.0 mm for Pelophylax_ridibundus: pi/6*0.2^3';
data.Wwi = 89.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_ridibundus: (11.0/10.6)^3*80';
data.Wwim = 45.8;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Pelophylax_ridibundus: (8.8/10.6)^3*80';

data.Ri  = 6835/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_ridibundus';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), SVL (cm)
1	5.797 6.061
2	6.813 6.595
3	8.355 7.480
4	9.152 7.991
5  10.037 8.371];
data.tL_fm(:,1) = (data.tL_fm(:,1)+1.8)  * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm    = C2K(16);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'TsioKyri2002'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '76CJB'; % Cat of Life
metaData.links.id_ITIS = '775185'; % ITIS
metaData.links.id_EoL = '332656'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_epeiroticus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_epeiroticus'; % ADW
metaData.links.id_Taxo = '996602'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+caralitanus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_epeiroticus}}';
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
bibkey = 'TsioKyri2002'; type = 'Article'; bib = [ ... 
'doi = {10.1078/0944-2006-00049}, ' ...
'author = {Tsiora, A. and Kyriakopoulou-Sklavounou, P.}, ' ... 
'year = {2002}, ' ...
'title = {A skeletochronological study of age and growth in relation to adult size in the water frog \emph{Rana epeirotica}}, ' ...
'journal = {Zoology}, ' ...
'volume = {105(1}, ' ...
'pages = {55–60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pelophylax+epeiroticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
