function [data, auxData, metaData, txtData, weights] = mydata_Pyganodon_grandis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Pyganodon_grandis'; 
metaData.species_en = 'Giant floater'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};
metaData.data_1     = {'t-L_f'; 't-Ww'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 10 31];      


%% set data
% zero-variate data

data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HansMack1988';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .0254;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jirk1986';  
  comment.Lb = 'value for Actinonaias_ligamentina';
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 3 yr and tL data';
data.Li  = 25.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwi  = 317; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Anodonta anatina: 13.2*(25.4/8.8)^3';

data.Ri = 724e3/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate at length 10.7 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.474	0.585
0.512	0.520
0.551	0.416
1.472	1.729
1.512	1.522
1.515	1.275
2.485	2.679
2.494	3.016
2.501	2.341
3.478	4.303
3.486	3.550
3.494	4.018
4.429	5.097
4.460	4.590
4.468	5.006
5.395	5.709
5.399	5.345
5.431	5.904
5.432	5.878
6.362	6.255
6.389	6.126
6.417	5.866
7.359	6.413
7.387	6.140
7.397	6.400
8.329	6.635
8.331	6.427
9.325	6.844
9.328	6.571];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HansMack1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4QNGF'; % Cat of Life
metaData.links.id_ITIS = '568179'; % ITIS
metaData.links.id_EoL = '47262613'; % Ency of Life
metaData.links.id_Wiki = 'Pyganodon_grandis'; % Wikipedia
metaData.links.id_ADW = 'Pyganodon_grandis'; % ADW
metaData.links.id_Taxo = '556552'; % Taxonomicon
metaData.links.id_WoRMS = '857389'; % WoRMS
metaData.links.id_molluscabase = '857389'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pyganodon_grandis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4749267}}';
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
bibkey = 'HansMack1988'; type = 'Article'; bib = [ ... 
'author = {John Mark Hanson and William C. Mackay and E. E. Prepas}, ' ... 
'year = {1988}, ' ...
'title = {The effetcs of water depth and density on the growth of a unionid clam}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {19}, ' ...
'pages = {345-355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ... 
'author = {Wendell R. Haag}, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biological Reviews}, ' ...
'volume = {88}, ' ...
'pages = {747-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jirk1986'; type = 'phdthesis'; bib = [ ... 
'author = {Kurt J. Jirka}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive biology and comparative growth rates of selected species of freshwater mussels ({B}ivalvia: {U}nionidae) in the {N}ew and {G}reenbrier {R}ivers, {V}irginia and {W}est {V}irginia}, ' ...
'school = {Virginia Polytechnic Institute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pyganodon_grandis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

