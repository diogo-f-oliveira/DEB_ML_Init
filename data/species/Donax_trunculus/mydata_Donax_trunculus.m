function [data, auxData, metaData, txtData, weights] = mydata_Donax_trunculus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Donacidae';
metaData.species    = 'Donax_trunculus'; 
metaData.species_en = 'Abrupt wedge shell'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 19]; 


%% set data
% zero-variate data

data.ab = 3;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                     bibkey.am = 'GaspFerr1999';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'GaspFerr1999';
data.Li  = 4.7; units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'GaspFerr1999';

data.Wwb = 4e-6;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';
data.Wwi = 4.3;     units.Wwi = 'g';  label.Wwi = 'ultimate tissue wet weight';  bibkey.Wwi = {'GaspFerr1999','AnseFren1980'};
  comment.Wwi = 'based on length-weight relation of F1 for Li';

data.Ri = 1e5/365; units.Ri  = '#/d';   label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
 
% uni-variate data
% t-L data
data.tL = [ ... % year class (yr), shell length (cm)
  0	1.139  
  1	2.541
  2	3.408
  3	3.898
  4	4.241
  5	4.437];
data.tL(:,1) = (.5 + data.tL(:,1)) * 365; % convert yr class to time since birth (d)
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GaspFerr1999';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: log total weight (mg) = 2.667 * log length (mm) - 0.358; log shell weight (mg) = 2.719 log length (mm) - 0.627';
metaData.bibkey.F1 = 'AnseFren1980'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '379TX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46474538'; % Ency of Life
metaData.links.id_Wiki = 'Donax_trunculus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39569'; % Taxonomicon
metaData.links.id_WoRMS = '139602'; % WoRMS
metaData.links.id_molluscabase = '139602'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Donax_trunculus}}';
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
bibkey = 'GaspFerr1999'; type = 'Article'; bib = [ ... 
'author = {M. B. Gaspar and R. Ferreira and  C. C. Monteiro}, ' ... 
'year = {1999}, ' ...
'title = {Growth and reproductive cycle of \emph{Donax trunculus} {L}., ({M}ollusca: {B}ivalvia) off {F}aro, southern {P}ortugal}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {41}, ' ...
'pages = {309-316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnseFren1980'; type = 'Article'; bib = [ ... 
'author = {A. D. Ansell and L. Frenkiel and M. Moueza}, ' ... 
'year = {1980}, ' ...
'title = {SEASONAL CHANGES IN TISSUE WEIGHT AND BIOCHEMICAL COMPOSITION FOR THE BIVALVE \emph{Donax trunculus} {L}. ON THE {A}LGERIAN COAST}, ' ...
'journal = {J. exp. mar. Biol. Ecol.}, ' ...
'volume = {45}, ' ...
'pages = {105-116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Donax-trunculus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


