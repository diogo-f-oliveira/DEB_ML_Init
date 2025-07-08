function [data, auxData, metaData, txtData, weights] = mydata_Ancylus_fluviatilis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Ancylus_fluviatilis'; 
metaData.species_en = 'Freshwater limpet'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 23]; 

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Hunt1953';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.12; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';             bibkey.Lb  = 'Hunt1953';
data.Lj  = 0.13; units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';        bibkey.Lj  = 'Hunt1953';
data.Lp  = 0.3; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty';          bibkey.Lp  = 'guess';
data.Li  = 0.72; units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'Hunt1953';

data.Wdi  = 3.4e-3; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'guess';
 comment.Wdi = 'based on size-corrected value for Patella vulgata: 1.9 * (0.73/6)^3';

data.Ni  = 46;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'Hunt1953';   
  temp.Ni = C2K(18);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'in 12 capsules';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d) at May 30, shell length (mm)
0.000	0.127
31.990	0.189
68.879	0.289
100.730	0.377
149.618	0.444
204.244	0.488
266.291	0.514
303.891	0.578
332.049	0.601];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hunt1953';
comment.tL = 'Data from Upper Craigton Burn, north of Glasgow';
    
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
D1 = 'Temperature in C for tL data is assumed to vary as T(t) = 8 + 8 * cos(2*pi*(t-100)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This snail is hermaproditic';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DPMC'; % Cat of Life
metaData.links.id_ITIS = '76581'; % ITIS
metaData.links.id_EoL = '452812'; % Ency of Life
metaData.links.id_Wiki = 'Ancylus_fluviatilis'; % Wikipedia
metaData.links.id_ADW = 'Ancylus_fluviatilis'; % ADW
metaData.links.id_Taxo = '38537'; % Taxonomicon
metaData.links.id_WoRMS = '821985'; % WoRMS
metaData.links.id_molluscabase = '821985'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ancylus_fluviatilis}}';
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
bibkey = 'Hunt1953'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1096-3642.1953.tb00191.x}, ' ...
'author = {W. Russell Hunter}, ' ... 
'year = {1953}, ' ...
'title = {On the growth of the fresh-water limpet \emph{Ancylus fluviatilis} {M}\"{u}ller}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {123}, ' ...
'pages = {623-636}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
