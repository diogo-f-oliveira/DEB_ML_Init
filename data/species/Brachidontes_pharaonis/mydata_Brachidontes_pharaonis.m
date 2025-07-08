function [data, auxData, metaData, txtData, weights] = mydata_Brachidontes_pharaonis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Brachidontes_pharaonis'; 
metaData.species_en = 'Pharaonic mussel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MI', 'MIr', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Valeria Montalto'; 'Valeria Palmeri'; 'Alessandro Rinaldi'; 'Gianluca Sara'};   
metaData.date_subm = [2013 05 26];           
metaData.email    = {'montaltovaleria@gmail.com'};  
metaData.address  = {'University of Palermo, Italy'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 1.1;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'MontRoch2006';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Data for B. solisianus';
data.tj = 24;     units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'MontRoch2006';   
  temp.tj = C2K(26);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'Data for B. solisianus';
data.tp = 182;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Rina2013';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'SaraPalm2013';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 9e-3;   units.Lb  = 'cm'; label.Lb  = 'shell height at birth';    bibkey.Lb  = 'MontRoch2006';
  comment.Lb = 'shell height is from umbo to ventral margin; Data for B. solisianus';
data.Lj  = 0.0273; units.Lj  = 'cm'; label.Lj  = 'shell height at metam';    bibkey.Lj  = 'MontRoch2006';
data.Lp  = 0.75;   units.Lp  = 'cm'; label.Lp  = 'shell height at puberty';  bibkey.Lp  = 'Mort1988';
data.Li  = 3.8;    units.Li  = 'cm'; label.Li  = 'shell height length';      bibkey.Li  = 'SaraPalm2013';

data.Wwp = 0.084;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Rina2013';
data.Wwi = 1.5456; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Rina2013';

data.Ri  = 441069/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'SaraPalm2013';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tL = [ ... % time since birth (a), shell height (cm)
0.5	0.66
1	1.46
2	2.34
3	3.07
4	3.59];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mont2013';
comment.tL = 'Data from Stagnone di Marsala in 2009 and 2010';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 3 * weights.Lb;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'This entry is discussed in MontPalm2014 and Palm2012';
metaData.bibkey.F1 = {'Palm2012','MontPalm2014'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MSSL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466653'; % Ency of Life
metaData.links.id_Wiki = 'Brachidontes_pharaonis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3944493'; % Taxonomicon
metaData.links.id_WoRMS = '140437'; % WoRMS
metaData.links.id_molluscabase = '140437'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachidontes_pharaonis}}';
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
bibkey = 'Rina2013'; type = 'Misc'; bib = [ ...
'author = {Alessandro Rinaldi}, ' ...
'year = {2013}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mont2013'; type = 'Misc'; bib = [ ...
'author = {Valeria Montalto}, ' ...
'year = {2013}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraPalm2013'; type = 'Article'; bib = [ ... 
'author = {Sar\`{a}, G. and Palmeri, V. and Montalto, V. and Rinaldi, A. and Widdows, J.}, ' ... 
'year = {2013}, ' ...
'title = {Parameterisation of bivalve functional traits for mechanistic eco-physiological {D}ynamic {E}nergy {B}udget ({D}{E}{B}) models}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {480}, ' ...
'pages = {99-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontPalm2014'; type = 'Article'; bib = [ ... 
'author = {Montalto, V. and Palmeri, V. and Rinaldi, A. and Kooijman, S. A. L. M. and Sara, G.}, ' ... 
'year = {2014}, ' ...
'title = {Dynamic {E}nergy {B}udget parameters of \emph{Brachidontes pharaonis}, a lessepsian bivalve in the {M}editerranean Sea.}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {47--51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mort1988'; type = 'Article'; bib = [ ... 
'author = {Morton B.}, ' ... 
'year = {1988}, ' ...
'title = {The population dynamics and reproductive cycle of \emph{Brachidontes variabilis} ({B}ivalvia: {M}ytilidae) in a {H}ong {K}ong {M}angrove}, ' ...
'journal = {Malacological Review}, ' ...
'volume = {21}, ' ...
'pages = {109--117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontRoch2006'; type = 'Article'; bib = [ ... 
'author = {Monteiro-Ribas, W. and Rocha-Miranda, F. and Romano, R.C. and Quintanilha, J.}, ' ... 
'year = {2006}, ' ...
'title = {Larval development of \emph{Brachidontes solisianus} ({B}ivalvia: {M}ytilidae), with notes on differences between its hinge system and that of the mollusc \emph{Perna perna}.}, ' ...
'journal = {Brazilian Journal of Biology}, ' ...
'volume = {66}, ' ...
'pages = {109--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Palm2012'; type = 'Phdthesis'; bib = [ ... 
'author = {Palmeri, V.}, ' ... 
'year = {2012}, ' ...
'title = {Risposte ecologiche dei filtratori bentonici marini alla variabilit\`{a} indotta dai fenomeni antropici}, ' ...
'school = {Palermo University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

