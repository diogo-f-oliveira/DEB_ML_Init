function [data, auxData, metaData, txtData, weights] = mydata_Penilia_avirostris
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Penilia_avirostris'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'}; 
metaData.data_1     = {'L-Wd'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 06]; 

%% set data
% zero-variate data

data.am = 30; units.am   = 'd';  label.am = 'life span';  bibkey.am = 'guess';     
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.038; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'AtieSaiz2008';
data.Lp  = 0.05;  units.Lp  = 'cm';  label.Lp  = 'ultimate total length';   bibkey.Lp  = 'AtieSaiz2008';
data.Li  = 0.0923;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'AtieSaiz2008';
data.Lim  = 0.0651;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'AtieSaiz2008';

data.Wwb  = 1.58e-6;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'AtieSaiz2008';
  comment.Wwb = 'based on stage 4 embryo length 315 mum, width 98 mum (from photo): pi/6*0.0315*0.0098^2';
data.Wdi  = 3.09e-6;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'AtieSaiz2006';

data.Ri = 0.46;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'AtieSaiz2008';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% length-dry weight
data.LWd = [ ... % length (mum), dry weight (mg indicated, but mug assumed)
566.964	0.762
597.470	0.730
629.464	1.355
665.923	1.385
763.393	1.578
872.024	3.525
894.345	2.629
896.577	2.931
908.482	2.234
923.363	3.094];
data.LWd(:,1) = data.LWd(:,1)*1e-4; % convert mum to cm
data.LWd(:,2) = data.LWd(:,2)*1e-6; % convert mug to g
units.LWd   = {'cm', 'g'};  label.LWd = {'length', 'dry weight'};  
bibkey.LWd = 'AtieSaiz2006';     

% length-fecundity
data.LN = [ ... % length(mum), fecundity (#)
580.714	1.006
620.063	1.985
645.139	2.007
647.065	3.029
650.488	4.051
650.970	6.078
665.242	7.018
680.000	3.052
681.926	4.074
682.512	1.027
690.212	5.064
691.391	6.102
699.943	5.066
729.242	7.081
735.283	8.071
745.763	8.089];
data.LN(:,1) = data.LN(:,1)/1e4; % convert mum to cm
units.LN   = {'cm', '#'};  label.LN = {'length', 'fecundity'};  
temp.LN = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'AtieSaiz2008';     
comment.LN = 'accumulation time of 8 d assumed, based on reported Ri of ';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '76J33'; % Cat of Life
metaData.links.id_ITIS = '83836'; % ITIS
metaData.links.id_EoL = '46498297'; % Ency of Life
metaData.links.id_Wiki = 'Penilia_avirostris'; % Wikipedia
metaData.links.id_ADW = 'Penilia_avirostris'; % ADW
metaData.links.id_Taxo = '33090'; % Taxonomicon
metaData.links.id_WoRMS = '410029'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AtieSaiz2008'; type = 'Article'; bib = [ ... 
'doi = {10.1093/plankt/fbm109}, ' ...
'author = {D. Atienza and E. Saiz and A. Skovgaard and I. Trepat and A. Calbert}, ' ... 
'year = {2008}, ' ...
'title = {Life history and population dynamics of the marine cladoceran \emph{Penilia avirostris} ({B}ranchiopoda: {C}ladocera) in the {C}atalan {S}ea ({N}{W} {M}editerranean)}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {30}, ' ...
'pages = {345–357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AtieSaiz2006'; type = 'Article'; bib = [ ... 
'doi = {10.1093/plankt/fbm109}, ' ...
'author = {Dacha Atienza and Enric Saiz and Albert Calbet}, ' ... 
'year = {2006}, ' ...
'title = {Feeding ecology of the marine cladoceran \emph{Penilia avirostris}: natural diet, prey selectivity and daily ration}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {315}, ' ...
'pages = {211–220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
