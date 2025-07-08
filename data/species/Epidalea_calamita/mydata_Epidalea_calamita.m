function [data, auxData, metaData, txtData, weights] = mydata_Epidalea_calamita

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Epidalea_calamita'; 
metaData.species_en = 'Natterjack toad'; 

metaData.ecoCode.climate = {'BSh','Csa','Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiFm', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 28];

%% set data
% zero-variate data

data.ab = 8;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Anaxyrus americanus';
data.tp = 1.5*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'BoomArnt1985';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.0;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'BoomArnt1985'; 
data.Lp  = 4.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'BoomArnt1985'; 
data.Li  = 7;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';
data.Lim  = 6.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'guess';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 40;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
data.Wwim = 32;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Wwi*(Lim/Li)^3: 40*(6.5/7)^3';
  
data.Ri  = 144/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Buf0 bufo: 1500*40/417 eggs per yr, 1 brood/year';
 
% uni-variate data
% time-length
data.tL = [ ... % time since 1 june (d), SVL (cm)
52.294	1.916
52.316	1.999
52.857	2.082
52.875	2.154
53.419	2.248
89.306	2.410
89.919	2.773
89.946	2.877
89.960	2.928
90.840	2.317
90.891	2.514
90.912	2.597
90.934	2.680
91.009	2.970
107.490	2.419
107.509	2.492
107.595	2.823
107.963	2.243
107.985	2.326
108.055	2.595
108.074	2.668
108.087	2.720
365-1.482	2.865
365-1.059	2.503
365-1.034	2.596
365-1.013	2.679
365-0.992	2.762
365-0.941	2.959
365-0.922	3.031
365-0.890	3.155
365-0.563	2.420
365+52.638	4.130
365+52.976	3.435
365+53.002	3.539
365+53.029	3.642
365+53.056	3.746
365+53.080	3.839
365+53.094	3.891
365+53.638	3.995
365+53.983	3.332
365+90.391	4.109
365+90.405	4.161
365+90.423	4.233
365+90.431	4.264
365+90.442	4.306
730         5.321];
data.tL(:,1) = data.tL(:,1) + 90; % set hatch at zero
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'body length'};  
bibkey.tL = 'BoomArnt1985';
comment.tL = 'temperatures is assumed to ary seasonally';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature (C) in tL data is assumed to vary as T(t)=7+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G2GX'; % Cat of Life
metaData.links.id_ITIS = '773560'; % ITIS
metaData.links.id_EoL = '1019146'; % Ency of Life
metaData.links.id_Wiki = 'Epidalea_calamita'; % Wikipedia
metaData.links.id_ADW = 'Epidalea_calamita'; % ADW
metaData.links.id_Taxo = '988961'; % Taxonomicon
metaData.links.id_WoRMS = '1515904'; % WoRMS
metaData.links.id_amphweb = 'Epidalea+calamita'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epidalea_calamita}}';
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
bibkey = 'BoomArnt1985'; type = 'Article'; bib = [ ... 
'author = {J. J. Boomsma and J. W. Arntzen}, ' ... 
'year = {1985}, ' ...
'title = {Abundance, Growth and Feeding of Natterjack Toads (\emph{Bufo calamita}) In a 4-Year-Old Artificial Habitat}, ' ...
'journal = {Journal of Applied Ecology}, ' ...
'volume = {22(2)}, ' ...
'pages = {395-405}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Epidalea+calamita}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1019146/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

