function [data, auxData, metaData, txtData, weights] = mydata_Lithobates_chiricahuensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Lithobates_chiricahuensis'; 
metaData.species_en = 'Chiricahua leopard frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 26];

%% set data
% zero-variate data

data.ab = 40;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'PlatLath1997';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.9;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'guess';
  comment.Lj = 'based on Lithobates_clamitans: 13.7*3/10.5';
data.Lp  = 4.6;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'PlatLath1997';
data.Lpm  = 4.6;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'PlatLath1997';
data.Li  = 13.7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'EoL';
data.Lim  = 11.2;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'guess';
  comment.Lim = 'based on Li and tL data: 13.5*9.926/11.972';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 257;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'EoL';
data.Wwim = 140;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi: (11.2/13.7)^3*257';
  
data.Ri  = 1.4e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lithobates_clamitans: 257/128*7e3 eggs per yr';

% univariate data
% time-length data for larva
data.tL_fm = [ ... % time since metam (d), SUL (cm): females, males
 2   NaN   7.450
 3	 8.240 8.208
 4	 8.006 8.643
 5	10.952 8.729
 6	11.773 8.655
 7	10.244 9.412
 8	11.385 NaN
 9	11.982 NaN
10	11.972 9.926];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365; % convert yr to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(28);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PlatLath1997'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males from the Barchas Ranch population, measured from snout to base of urostyle, but treated as SVL';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3VHPV'; % Cat of Life
metaData.links.id_ITIS = '775086'; % ITIS
metaData.links.id_EoL = '61686627'; % Ency of Life
metaData.links.id_Wiki = 'Lithobates_chiricahuensis'; % Wikipedia
metaData.links.id_ADW = 'Lithobates_chiricahuensis'; % ADW
metaData.links.id_Taxo = '996553'; % Taxonomicon
metaData.links.id_WoRMS = 'Rana+chiricahuensis'; % WoRMS
metaData.links.id_amphweb = ''; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithobates_chiricahuensis}}';
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
bibkey = 'PlatLath1997'; type = 'Article'; bib = [ ... 
'author = {J. E. Platz and A. Lathrop and L. Hofbauer and M. Vradenburg}, ' ... 
'year = {1997}, ' ...
'title = {Age Distribution and Longevity in the {R}amsey {C}anyon Leopard Frog, \emph{Rana subaquavocalis}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {31(4)}, ' ...
'pages = {552-557}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+chiricahuensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/331015/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

