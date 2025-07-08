function [data, auxData, metaData, txtData, weights] = mydata_Rana_sauteri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_sauteri'; 
metaData.species_en = 'Kanshirei Village frog'; 

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

data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'HsuHsie2014';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.36;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'HsuHsie2014';
data.Lp  = 3.2;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'guess';
data.Li  = 5.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'HsuHsie2014';
data.Lim  = 4.6;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'HsuHsie2014';

data.Wwb = 0.0244;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LaiKam2003';
  comment.Wwb = 'based egg diameter of 3.6 mm: pi/6*0.36^3';
data.Wwi = 14.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 10.9 g for SVL 5.29: (5.8/5.29)^3*10.9';

data.Ri  = 225/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'LaiKam2003';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (d), SVL (cm)
0	1.361 1.352
1	4.553 3.663
2	5.018 3.846
3	5.390 4.065
4	5.691 4.257
5	5.865 4.282];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.5)*365; % convert yr to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm   = C2K(20);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HsuHsie2014'; treat.tL_fm = {1,'females','males'};
subtitle.tL_fm = 'data for 1380 m Central Mountain Range, Taiwan';
comment.tL_fm = 'data for 1380 m Central Mountain Range, Taiwan';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lp = 0 * weights.Lp;

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
F1 = 'Tadpoles have an abdominal sucker, and adaptation to living in fast-flowing streams';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79393'; % Cat of Life
metaData.links.id_ITIS = '1106616'; % ITIS
metaData.links.id_EoL = '332009'; % Ency of Life
metaData.links.id_Wiki = 'Rana_sauteri'; % Wikipedia
metaData.links.id_ADW = 'Rana_sauteri'; % ADW
metaData.links.id_Taxo = '145993'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+sauteri'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_sauteri}}';
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
bibkey = 'HsuHsie2014'; type = 'Article'; bib = [ ... 
'author = {Fu-Hsiung Hsu and Yi-Shan Hsieh and Sheng-Hai Wu and Yeong-Choy Kam}, ' ... 
'year = {2014}, ' ...
'title = {Altitudinal variation in body size and age structure of the {S}auter''s frog \emph{Rana sauteri} in {T}aiwan}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {53}, ' ...
'pages = {62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LaiKam2003'; type = 'Article'; bib = [ ... 
'author = {Su-Ju Lai and Yeong-Choy Kam and Yao-Sung Lin}, ' ... 
'year = {2003}, ' ...
'title = {Elevational Variation in Reproductive and Life History Traits of {S}auter''s Frog \emph{Rana sauteri} {B}oulenger, 1909 in {T}aiwan}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {42(1)}, ' ...
'pages = {193-202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+sauteri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

