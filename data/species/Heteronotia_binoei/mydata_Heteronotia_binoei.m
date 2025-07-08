function [data, auxData, metaData, txtData, weights] = mydata_Heteronotia_binoei
%% set metadata
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Gekkonidae';
metaData.species    = 'Heteronotia_binoei';
metaData.species_en = 'Bynoe''s gecko CA6';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 'Ww-JO'; 't-Ww'; 'T-ab'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney'};  
metaData.date_subm = [2017 06 12];
metaData.email    = {'mrke@unimelb.edu.au'};  
metaData.address  = {'School of BioSciences, The University of Melbourne, 3010, Australia'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2017 06 12];

%% set data
% zero-variate data;
data.ab = 85.1;     units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Kear2004a';
temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';

data.ap = data.ab+123; units.ap = 'd'; label.ap = 'age at puberty';              bibkey.ap = 'Kear2004b';
temp.ap = C2K(29); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Fig. 7 from Kear2004b - rough';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Baue2013';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'probably an underestimate, Bauer reports 13.6 based on captive records, Kearney, Moritz and Roberts recaptured an individual marked 15 years earlier as an adult at Paynes Find Station';

data.Lb  = 2.037;     units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Kear2004c';
  comment.Lb = 'mean size of newborns';
data.Lp  = 4.3;      units.Lp  = 'cm';    label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'Kear2005';
  comment.Lp = 'smallest female that reproduced - likely an underesimate';
data.Li  = 5.5;     units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Kear2005';
  comment.Lp = 'largest female in data set';

data.Wwb = 0.0167*data.Lb^3.2594;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'Kear2004c','Robe2012'};
  comment.Wwb = 'computed as 0.0167*Lb^3.2594';
data.Wwp = 0.0167*data.Lp^3.2594;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'Kear2004c','Robe2012'};
  comment.Wwp = 'computed as 0.0167*Lp^3.2594';
data.Wwi = 0.0167*data.Li^3.2594;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'Kear2004c','Robe2012'};
  comment.Wwi = 'computed as 0.0167*Li^3.2594';

data.Ri  = 4.2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Kear2005';
temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.Tab = [24  27  30; 153 85.1    60]'; units.Tab  = {'C','d'};  label.Tab  = {'temperature','development time'};  bibkey.Tab  = 'Kear2004a';

data.LW = csvread('LW.csv');
units.LW = {'cm', 'g'};     label.LW = {'snout vent length', 'wet weight'};  bibkey.LW = {'Kear2004a','Robe2012'};

data.tW = csvread('tW.csv');
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  bibkey.tW = {'Kear2004c'};
temp.tW = C2K(29);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
 
data.WO = csvread('WO.csv');
units.WO = {'g','mlO2/min'}; label.WO = {'weight','O2 consumption rate'};  bibkey.WO = {'Kear2004c','Robe2012'};
temp.WO = C2K(30);  units.temp.WO = 'K'; label.temp.WO = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights
weights.tW = weights.tW * 5; % given uncertainty of ap, put more weight on tW
weights.Lp = weights.Lp * 0.5; % limit importance of Lp because only have age at first eggs laid

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The value for l_p is length at first first clutch, but this does not account for the time taken to build up reproduction buffer for first clutch';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6LSNV'; % Cat of Life
metaData.links.id_ITIS = '818749'; % ITIS
metaData.links.id_EoL = '456690'; % Ency of Life
metaData.links.id_Wiki = 'Heteronotia_binoei'; % Wikipedia
metaData.links.id_ADW = 'Heteronotia_binoei'; % ADW
metaData.links.id_Taxo = '90870'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Heteronotia&species=binoei'; % ReptileDB
metaData.links.id_AnAge = 'Heteronotia_binoei'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heteronotia_binoei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
    'author = {Kooijman, S. A. L. M.}, ' ...
    'year = {2010}, ' ...
    'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
    'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
    'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
    'howpublished = {url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2004a'; type = 'Article'; bib = [ ...  % 
   'author = {Kearney, M. R. and Shine, R.}, ' ...
   'title = {Developmental success, stability and plasticity in closely related parthenogenetic and sexual lizards ({H}eteronotia, {G}ekkonidae)}, ' ...
   'journal = {Evolution}, ' ...
   'volume = {58}, ' ...
   'number = {7}, ' ...
   'pages = {1560--1572}, ' ...
   'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2004b'; type = 'PhDthesis'; bib = [ ... 
   'author = {Kearney, M. R.}, ' ...
   'title = {The ecology and evolution of hybrid parthenogenesis in the {A}ustralian arid zone}, ' ...
   'university = {The University of Sydney}, ' ...
   'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'Kear2004c'; type = 'Article'; bib = [ ...  % 
   'author = {Kearney, M. K. and Shine, R.}, ' ...
   'title = {Morphological and physiological correlates of hybrid parthenogenesis}, ' ...
   'journal = {The American Naturalist}, ' ...
   'volume = {164}, ' ...
   'number = {6}, ' ...
   'pages = {803--813}, ' ...
   'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2005'; type = 'Article'; bib = [ ...  %   
	'title = {Lower fecundity in parthenogenetic geckos than in sexual relatives in the {A}ustralian arid zone}, ' ...
	'volume = {18}, ' ...
	'journal = {Journal of Evolutionary Biology}, ' ...
	'author = {Kearney, M. R. and Shine, R.}, ' ...
	'year = {2005}, ' ...
	'pages = {609--618}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe2012'; type = 'Article'; bib = [ ...  % 
   'author = {Roberts, J. A. and Vo, H. D. and Fujita, M. K. and Moritz, C. and Kearney, M. R.}, ' ...
   'title = {Physiological implications of genomic state in parthenogenetic lizards of reciprocal hybrid origin}, ' ...
   'journal = {Journal of Evolutionary Biology}, ' ...
   'volume = {25}, ' ...
   'number = {2}, ' ...
   'pages = {252-263}, ' ...
   'DOI = {10.1111/j.1420-9101.2011.02438.x}, ' ...
   'year = {2012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baue2013'; type = 'Book'; bib = [ ...  % 
   'author = {Bauer, A. M.}, ' ...
   'title = {Geckos: The Animal Answer Guide}, ' ...
   'publisher = {Johns Hopkins University Press}, ' ...
   'address = {Baltimore, USA}, ' ...
   'year = {2013}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

