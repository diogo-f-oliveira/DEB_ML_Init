function [data, auxData, metaData, txtData, weights] = mydata_Alasmidonta_heterodon

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Alasmidonta_heterodon'; 
metaData.species_en = 'Dwarf wedgemussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 03];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Baue1987 gives 93 yrs is typical in natural populations';

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 4.58;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Mich1993';

data.Wwi  = 3.5; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(4.58/7.3)^3';

data.Ri = 2661/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate for SL 2.90 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL1 = [ ... % time since settlement (yr), shell length (cm)
0.993	1.317
1.990	1.946
2.986	2.610
3.921	2.804
4.940	3.318
5.960	3.523
6.937	3.809
7.936	3.991
8.957	4.139
9.913	4.378];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'Aquia Creek'};  
temp.tL1 = C2K(12);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Mich1993';
comment.tL1 = 'Data from Aquia Creek; mean temperature is guessed';
%
data.tL2 = [ ... % time since settlement (yr), shell length (cm)
1.007	1.227
1.994	1.906
3.014	2.533
4.013	2.770
4.980	3.053
5.979	3.350];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Tar River'};  
temp.tL2 = C2K(15);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Mich1993';
comment.tL2 = 'Data from Tar River; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 10 * weights.tL1;
weights.tL2 = 10 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from Aquia Creek, Tar River'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Sexes separate';
metaData.bibkey.F1 = 'Mich1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BF8C'; % Cat of Life
metaData.links.id_ITIS = '79917'; % ITIS
metaData.links.id_EoL = '449672'; % Ency of Life
metaData.links.id_Wiki = 'Alasmidonta_heterodon'; % Wikipedia
metaData.links.id_ADW = 'Alasmidonta_heterodon'; % ADW
metaData.links.id_Taxo = '240141'; % Taxonomicon
metaData.links.id_WoRMS = '571953'; % WoRMS
metaData.links.id_molluscabase = '571953'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alasmidonta_heterodon}}';
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
bibkey = 'Mich1993'; type = 'Phdthesis'; bib = [ ...
'author = {David L. Michaelson}, ' ... 
'year = {1993}, ' ...
'title = {Life history of the endangered fdwarf wedgemussel \emph{Alasmidonta heterodon} ({L}ea, 1829) ({P}elecypoda,: {U}nionidae, in the Tar River, North Carolina and Aquia Creek, Virginia}, ' ...
'school = {Virginia Polytechnic Instigtute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

