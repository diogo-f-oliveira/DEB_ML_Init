function [data, auxData, metaData, txtData, weights] = mydata_Lithobates_clamitans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Lithobates_clamitans'; 
metaData.species_en = 'Green frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 05 26];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 05 26]; 


%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '3 to 7 d';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.00;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'amphibiaweb';
  comment.Lj = 'SVL 21 to 38 mm ';
data.Lp  = 3.26;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Mart1956';
data.Li  = 10.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Mart1956';

data.Wwb = 0.0018;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 128;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'GormHaas2011';
  comment.Wwi = 'based on 22.9 g for SVL 5.91: (10.5/5.91)^3*22.9';

data.Ri  = 7000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length data for larva
data.tL = [ ... % time since 1 sept 1948 (d), SVL (cm)
4.647	4.812
70.108	5.099 % start hibernation at 15.5 C
215.331	5.383 % end of hibertnation
225.885	5.462
237.483	5.636
253.831	5.837
292.316	6.403
322.356	6.927
356.637	7.328
369.302	7.423
404.138	7.624
423.683	7.614];
data.tL(:,1) = data.tL(:,1) + 105; % set origin at metam in june/july 1947
units.tL  = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mart1956';
comment.tL = 'data from Loch Alpine, July, 1948; temperature between 2 and 26 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed, except for tL where is oscillates as 14+12*sin(pi*2*(t-150)/365)';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VHPW'; % Cat of Life
metaData.links.id_ITIS = '775087'; % ITIS
metaData.links.id_EoL = '47365239'; % Ency of Life
metaData.links.id_Wiki = 'Lithobates_clamitans'; % Wikipedia
metaData.links.id_ADW = 'Lithobates_clamitans'; % ADW
metaData.links.id_Taxo = '996554'; % Taxonomicon
metaData.links.id_WoRMS = '1485168'; % WoRMS
metaData.links.id_amphweb = 'Rana+clamitans'; % AmphibiaWeb
metaData.links.id_AnAge = 'Lithobates_clamitans'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithobates_clamitans}}';
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
bibkey = 'Mart1956'; type = 'Article'; bib = [ ... 
'author = {Bernard Martof}, ' ... 
'year = {1956}, ' ...
'title = {Growth and Development of the Green Frog, \emph{Rana clamitans}, Under Natural Conditions}, ' ...
'journal = {American Midland Naturalist}, ' ...
'volume = {55(1)}, ' ...
'pages = {101-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoonBridg2001'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s004420100749}, ' ...
'author = {Michelle D. Boone and Christine M. Bridges and Betsie B. Rotherme}, ' ... 
'year = {2001}, ' ...
'title = {Growth and development of larval green frogs (\emph{Rana clamitans}) exposed to multiple doses of an insecticide}, ' ...
'journal = {Oecologia}, ' ...
'volume = {129}, ' ...
'pages = {518-524}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GormHaas2011'; type = 'Article'; bib = [ ... 
'author = {Thomas A. Gorman and Carola A. Haas}, ' ... 
'year = {2011}, ' ...
'title = {Seasonal Microhabitat Selection and Use of Syntopic Populations of \emph{Lithobates okaloosae} and \emph{Lithobates clamitans clamitans}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {45(3)}, ' ...
'pages = {313-318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+clamitans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lithobates_clamitans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

