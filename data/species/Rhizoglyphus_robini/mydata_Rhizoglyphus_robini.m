function [data, auxData, metaData, txtData, weights] = mydata_Rhizoglyphus_robini 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Sarcoptiformes'; 
metaData.family     = 'Acaridae';
metaData.species    = 'Rhizoglyphus_robini'; 
metaData.species_en = 'Bulb mite'; 

metaData.ecoCode.climate = {'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0jTg', '0jTh'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab_f'; 'ap_f'; 'am_f'; 'Lb_f'; 'Lp_f'; 'Li_f'; 'Vb_f'; 'Vp_f';'Vi_f'; 'Ri_f'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Tom van den Beuken'};                                                 
metaData.date_subm = [2015 04 21];                                                          
metaData.email    = {'t.p.g.vandenbeuken@uva.nl'};                                          
metaData.address  = {'University of Amsterdam (UvA), 1090GE Amsterdam, The Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 02 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 

%% set data
% zero-variate data

data.ab_fp = 2.86;     units.ab_fp = 'd';    label.ab_fp = 'age at birth';      bibkey.ab_fp = 'Smal2011';   
  temp.ab_fp = C2K(27); units.temp.ab_fp = 'K'; label.temp.ab_fp = 'temperature';
data.ab_fy = 2.58;     units.ab_fy = 'd';    label.ab_fy = 'age at birth';      bibkey.ab_fy = 'Smal2011';   
  temp.ab_fy = C2K(27); units.temp.ab_fy = 'K'; label.temp.ab_fy = 'temperature';
  comment.ab_fy = 'age upon ecdysis, can be off by max. one day as they were not checked during the night for emerging';
data.tp_fp = 32.94;    units.tp_fp = 'd';    label.tp_fp = 'time since birth at puberty'; bibkey.tp_fp = 'Smal2011';
  temp.tp_fp = C2K(27); units.temp.tp_fp = 'K'; label.temp.tp_fp = 'temperature';
data.tp_fy = 9.58;     units.tp_fy = 'd';    label.tp_fy = 'time since birth at puberty'; bibkey.tp_fy = 'Smal2011';
  temp.tp_fy = C2K(27); units.temp.tp_fy = 'K'; label.temp.tp_fy = 'temperature';
data.am_fp = 69.76;    units.am_fp = 'd';    label.am_fp = 'life span';         bibkey.am_fp = 'Smal2011';   
  temp.am_fp = C2K(27); units.temp.am_fp = 'K'; label.temp.am_fp = 'temperature'; 
data.am_fy = 40.38;    units.am_fy = 'd';    label.am_fy = 'life span';          bibkey.am_fy = 'Smal2011';   
  temp.am_fy = C2K(27); units.temp.am_fy = 'K'; label.temp.am_fy = 'temperature'; 

data.Lb_fp  = 0.0167;  units.Lb_fp  = 'cm';  label.Lb_fp  = 'total length at birth';   bibkey.Lb_fp  = 'Smal2011';
data.Lb_fy  = 0.0169;  units.Lb_fy  = 'cm';  label.Lb_fy  = 'total length at birth';   bibkey.Lb_fy  = 'Smal2011';
data.Lp_fp  = 0.034;   units.Lp_fp  = 'cm';  label.Lp_fp  = 'total length at puberty'; bibkey.Lp_fp  = 'Smal2011';
data.Lp_fy  = 0.054;   units.Lp_fy  = 'cm';  label.Lp_fy  = 'total length at puberty'; bibkey.Lp_fy  = 'Smal2011';
data.Li_fp  = 0.0486;  units.Li_fp  = 'cm';  label.Li_fp  = 'ultimate total length';   bibkey.Li_fp  = 'Smal2011';
data.Li_fy  = 0.0674;  units.Li_fy  = 'cm';  label.Li_fy  = 'ultimate total length';   bibkey.Li_fy  = 'Smal2011';

data.Vb_fp  = 1.49e-6;  units.Vb_fp  = 'cm^3';  label.Vb_fp  = 'volume at birth';      bibkey.Vb_fp  = 'Beuk2015';
  comment.Vb_fp = 'All volumes are calculated as pi/6 * width^2 * length';
data.Vb_fy  = 1.74e-6;  units.Vb_fy  = 'cm^3';  label.Vb_fy  = 'volume at birth';      bibkey.Vb_fy  = 'Beuk2015';
data.Vp_fp  = 1.17e-5;  units.Vp_fp  = 'cm^3';  label.Vp_fp  = 'volume at puberty';    bibkey.Vp_fp  = 'Beuk2015';
data.Vp_fy  = 5.09e-5;  units.Vp_fy  = 'cm^3';  label.Vp_fy  = 'volume at puberty';    bibkey.Vp_fy  = 'Beuk2015';
data.Vi_fp  = 3.54e-5;  units.Vi_fp  = 'cm^3';  label.Vi_fp  = 'ultimate volume';      bibkey.Vi_fp  = 'Beuk2015';
data.Vi_fy  = 1.00e-4;  units.Vi_fy  = 'cm^3';  label.Vi_fy  = 'ultimate volume';      bibkey.Vi_fy  = 'Beuk2015';

data.Ri_fp  = 2.65;     units.Ri_fp  = '#/d';   label.Ri_fp  = 'maximum reprod rate';  bibkey.Ri_fp  = 'Smal2011';   
  temp.Ri_fp = C2K(27); units.temp.Ri_fp = 'K'; label.temp.Ri_fp = 'temperature';
data.Ri_fy  = 21.89;    units.Ri_fy  = '#/d';   label.Ri_fy  = 'maximum reprod rate';  bibkey.Ri_fy  = 'Smal2011';   
  temp.Ri_fy = C2K(27); units.temp.Ri_fy = 'K'; label.temp.Ri_fy = 'temperature';
   
%% set weights for all real data
weights = setweights(data, []);
weights.Vb_fp = 100 * weights.Vb_fp;
weights.Vb_fy = 100 * weights.Vb_fy;
weights.Vp_fp = 100 * weights.Vp_fp;
weights.Vp_fy = 100 * weights.Vp_fy;
weights.Vi_fp = 100 * weights.Vi_fp;
weights.Vi_fy = 100 * weights.Vi_fy;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'data on scrambler males fed on ad libitum filter paper (fp) or yeast (fy), except reprod, which is of females';
D2 = 'data for fighter males was incomplete';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'The males of this mite species have two types; fighters and scramblers';
metaData.bibkey.F1 = 'Smal2011'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '10409051'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoglyphus'; % Wikipedia
metaData.links.id_ADW = 'Rhizoglyphus_robini'; % ADW
metaData.links.id_Taxo = '143153'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhizoglyphus}}';
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
bibkey = 'Smal2011'; type = 'Article'; bib = [ ... 
'author = {Smallegange, I. M.}, ' ... 
'year = {2011}, ' ...
'title = {Supplementary data of Complex environmental effects on the expression of alternative reproductive phenotypes in the bulb mite}, ' ...
'journal = {Evolutionary Ecology}, ' ...
'volume = {25-3}, ' ...
'pages = {857--873}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beuk2015'; type = 'Misc'; bib = [ ...
'author = {Beuken, T.P.G. van den}, ' ... 
'year = {2015}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

