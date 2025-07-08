function [data, auxData, metaData, txtData, weights] = mydata_Chiton_tuberculatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Polyplacophora'; 
metaData.order      = 'Chitonida'; 
metaData.family     = 'Chitonidae';
metaData.species    = 'Chiton_tuberculatus'; 
metaData.species_en = 'West Indian green chiton'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 21]; 

%% set data
% zero-variate data

data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Croz1918';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'in view of growth at 12 yr, life span is likely to be underestimated';

data.Lp  = 2.5;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Lepidochitona_cinerea: 0.6*10/2.4)'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate length'; bibkey.Li  = 'Croz1918';
  comment.Li = 'sealifebase gives 7.6 cm,';

data.Wwb = 4.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 160-200 mum for Lepidochitona_cinerea:  pi/6*0.02^3';
data.Wwj = 4.3e-6;  units.Wwj = 'g'; label.Wwj = 'wet weight at birth'; bibkey.Wwj = 'guess';
  comment.Wwj = 'Based on settlement following a few hours after hatching';
data.Wwi = 120;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Lord2012';
  comment.Wwi = 'based on equally-sized Katharina tunicata';

data.Ri  = 6.5e5/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for yearly fecundity of Lepidochitona_cinerea: (10/1.4)^3*1.8e3';


% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.965	1.268
1.949	3.158
3.039	3.876
3.969	4.569
5.011	5.407
6.021	6.053
7.016	6.914
8.011	7.727
8.989	8.445
10.013	8.708
11.020	8.971
12.013	9.354];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Croz1918';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'A plaktonic stage of only a few hours is assumed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'No sexual dimorphism';
metaData.bibkey.F1 = 'Croz1918';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XW2S'; % Cat of Life
metaData.links.id_ITIS = '79015'; % ITIS
metaData.links.id_EoL = '450319'; % Ency of Life
metaData.links.id_Wiki = 'Chiton_tuberculatus'; % Wikipedia
metaData.links.id_ADW = 'Chiton_tuberculatus'; % ADW
metaData.links.id_Taxo = '34522'; % Taxonomicon
metaData.links.id_WoRMS = '140201'; % WoRMS
metaData.links.id_molluscabase = '140201'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chiton_tuberculatus}}';
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
bibkey = 'Croz1918'; type = 'Article'; bib = [ ... 
'author = {W. J. Crozier}, ' ... 
'year = {1918}, ' ...
'title = {Growth and Duration of Life of \emph{Chiton tuberculatus}}, ' ...
'journal = {Proceedings of the National Academy of Sciences of the United States of America}, ' ...
'volume = {4}, ' ...
'number = {11}, ' ...
'pages = {322-325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lord2012'; type = 'Article'; bib = [ ...
'doi = {10.4002/040.055.0104}, ' ...
'author = {Joshua P. Lord}, ' ... 
'year = {2012}, ' ...
'title = {Longevity and growth rates of the gumboot chiton \emph{Cryptochiton stelleri}, and the black leather chiton, \emph{Katharina tunicata}}}, ' ...
'journal = {Malacologia}, ' ...
'volume = {55}, ' ...
'number = {1}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Chiton-tuberculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

