function [data, auxData, metaData, txtData, weights] = mydata_Mulloidichthys_flavolineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Mulloidichthys_flavolineatus'; 
metaData.species_en = 'Yellowstripe goatfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 22];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ElRe2018'; 
data.Li  = 43;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.1e-4; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'ElRe2018';
  comment.Wwb = 'based on egg diameter of 0.99 mm: pi/6*0.099^3';
data.Wwp = 46.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','ElRe2018'};
  comment.Wwp = 'based on 0.01072*Lp^3.09, see F1';
data.Wwi = 1.2e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.09, see F1; max published weight 423.30 g';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
73.424	12.213
227.488	16.317
289.029	16.689
319.163	18.287
349.297	19.415
365+14.006	19.132
365+74.698	20.917
365+104.831	21.103
365+320.012	23.345
365+350.994	23.530
730+135.390	24.466];
data.tL(:,1) = data.tL(:,1) + 250; % set origin to birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
15.975	41712.331
18.078	65684.941
19.917	73835.616
21.972	106917.808
24.036	112191.781
25.962	128493.145];
units.LN   = {'cm', 'cm'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(27.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ElRe2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '742Y3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578806'; % Ency of Life
metaData.links.id_Wiki = 'Mulloidichthys_flavolineatus'; % Wikipedia
metaData.links.id_ADW = 'Mulloidichthys_flavolineatus'; % ADW
metaData.links.id_Taxo = '180471'; % Taxonomicon
metaData.links.id_WoRMS = '218647'; % WoRMS
metaData.links.id_fishbase = 'Mulloidichthys-flavolineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mulloidichthys_flavolineatus}}';
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
bibkey = 'Murt2002'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://eprints.cmfri.org.in/3536/1/Special_Publication_No_72.pdf}}, ' ...
'author = {Murty, V.S.}, ' ... 
'year = {2002}, ' ...
'title = {Marine Ornamental Fish Resources of {L}akshadweep}, ' ...
'institution = {Central Marine Fisheries Research Institute}, ' ...
'volume = {Spl.Pub. 72)}, ' ...
'pages = {134 pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElRe2018'; type = 'Article'; bib = [ ... 
'author = {Mohamed A. Abu El-Regal}, ' ... 
'year = {2018}, ' ...
'title = {Reproductive biology of the yellow-striped goatfish \emph{Mulloidichthys flavolineatus} ({L}acep\`{e}de, 1801) ({P}erciformes: {M}ullidae) in the {R}ed {S}ea, {E}gypt}, ' ...
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {22(4)}, ' ...
'pages = {233- 247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mulloidichthys-flavolineatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
