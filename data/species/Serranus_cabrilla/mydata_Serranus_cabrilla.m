function [data, auxData, metaData, txtData, weights] = mydata_Serranus_cabrilla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Serranus_cabrilla'; 
metaData.species_en = 'Comber'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 16]; 

%% set data
% zero-variate data
data.am = 11*365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'guess';
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Serranus scriba';
  
data.Lp = 17.5;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 40;   units.Li = 'cm';  label.Li = 'ultimate total length'; bibkey.Li  = 'fishbase'; 

data.Wwb = 1.9e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 0.712 mm of Serranus scriba: pi/6*0.0712^3';   
data.Wwp = 60.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase'; 
  comment.Wwi = 'based on length-weight conversion';
data.Wwi = 640;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on length-weight conversion';

data.Ri = 73e3/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data
% time-length
data.tL = [... % yr class (yr), total length at f and T
    0 8.748
    1 11.851
    2 15.102
    3 17.911
    4 19.300
    5 19.910];  
data.tL (:,1)= (data.tL (:,1) + 1.75) * 365; % convert yt class to time since birth in days 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TserTsim2001'; 
comment.tL = 'one yr is added to otolith-based age estimation';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'kap_R is set to 0.95/2 because of being hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Hermaphroditic';
metaData.bibkey.F1 = 'GarcTuse1997'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WWXZ'; % Cat of Life
metaData.links.id_ITIS = '167865'; % ITIS
metaData.links.id_EoL = '46579257'; % Ency of Life
metaData.links.id_Wiki = 'Serranus_cabrilla'; % Wikipedia
metaData.links.id_ADW = 'Serranus_cabrilla'; % ADW
metaData.links.id_Taxo = '187452'; % Taxonomicon
metaData.links.id_WoRMS = '127041'; % WoRMS
metaData.links.id_fishbase = 'Serranus-cabrilla'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Serranus_cabrilla}}';
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
bibkey = 'TserTsim2001'; type = 'Article'; bib = [ ... 
'author = {G. Tserpes and N. Tsimenides}, ' ... 
'year = {2001}, ' ...
'title = {Age, growth and mortality of \emph{Serranus cabrilla} ({L}innaeus, 1758) on the {C}retan shelf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {51}, ' ...
'pages = {27-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GarcTuse1997'; type = 'Article'; bib = [ ... 
'author = {M. M. Garc\''{i}a-D\''{i}az and V. M. Tuset and J. A. Gonz\''{a}lez and J. Socorro}, ' ... 
'year = {1997}, ' ...
'title = {Sex and reproductive aspects in \emph{Serranus cabrilla} ({O}steichthyes: {S}erranidae): macroscopic and histological approaches}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {127}, ' ...
'pages = {379-386}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Serranus-cabrilla.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
