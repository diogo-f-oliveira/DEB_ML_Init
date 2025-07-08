function [data, auxData, metaData, txtData, weights] = mydata_Anguis_fragilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Anguidae';
metaData.species    = 'Anguis_fragilis'; 
metaData.species_en = 'Slow worm'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 07];

%% set data
% zero-variate data

data.ap = 2.5*365;   units.ap = 'd';      label.ap = 'age at puberty';             bibkey.ap = 'FerrGala2004';
  temp.ap = C2K(14); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 54*365;    units.am = 'd';      label.am = 'life span';                  bibkey.am = 'Wiki';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.872;    units.Lb  = 'cm';    label.Lb  = 'SVL at hatching';           bibkey.Lb  = 'FerrGala2004';  
data.Lp  = 13.5;     units.Lp  = 'cm';    label.Lp  = 'SVL at puberty';            bibkey.Lp  = 'FerrGala2004';  
data.Li  = 21;       units.Li  = 'cm';    label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'FerrGala2004';

data.Wwb = 0.549;    units.Wwb = 'g';     label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'FerrGala2004';
data.Ww_L = 13.8;    units.Ww_L = 'g';    label.Ww_L = 'wet weight at SVL = 16.8 cm'; bibkey.Ww_L = 'FerrGala2004';
  
data.Ri  = 6.88/365; units.Ri  = '#/d';   label.Ri  = 'reprod rate at 13.8 g';     bibkey.Ri  = 'FerrGala2004';   
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% t-L data  for females
data.tL = [ ... % time since birth (yr), SVL (cm)
0.5 4.872
1.5 9.880
2.5 13.65
3.5 15.00];
units.tL  = {'yr', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FerrGala2004';

% L-N data
data.LN = [ ... % SVL (cm), litter size (#)
13.514	6.051
14.110	4.978
14.210	5.978
14.416	7.054
14.504	5.979
14.700	5.030
14.801	8.005
14.899	8.005
15.022	8.031
15.100	5.031
15.107	4.031
15.203	1.981
15.204	2.981
15.206	3.981
15.209	7.031
15.215	5.056
15.312	4.006
15.396	5.982
15.407	8.007
15.418	4.082
15.598	4.032
15.693	7.982
15.808	8.083
15.902	4.983
16.013	9.058
16.103	2.009
16.108	6.059
16.305	7.034
16.307	8.059
16.401	4.984
16.411	5.984
16.413	8.059
16.414	9.059
16.417	4.009
16.525	6.060
16.613	3.985
16.623	6.060
16.706	7.060
16.816	10.086
16.911	7.011
17.004	10.036
17.014	4.011
17.120	4.011
17.599	8.013
17.714	8.013
17.812	8.013
17.910	8.014
18.008	8.014
18.109	10.064
18.115	8.014
18.200	4.014
18.211	5.989
18.310	7.065
18.406	12.065
18.413	11.040
18.596	7.091
18.698	3.016
19.218	7.042
19.418	10.018
19.606	10.018
19.617	12.043
19.702	7.994
19.915	8.069
20.010	12.044
20.021	8.044
20.604	9.996
20.811	12.047];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'clutch size'};  
temp.LN   = C2K(14);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'FerrGala2004';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'FerrGala2004'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '672H4'; % Cat of Life
metaData.links.id_ITIS = '1146449'; % ITIS
metaData.links.id_EoL = '453239'; % Ency of Life
metaData.links.id_Wiki = 'Anguis_fragilis'; % Wikipedia
metaData.links.id_ADW = 'Anguis_fragilis'; % ADW
metaData.links.id_Taxo = '49698'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anguis&species=fragilis'; % ReptileDB
metaData.links.id_AnAge = 'Anguis_fragilis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguis_fragilis}}';
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
bibkey = 'FerrGala2004'; type = 'Article'; bib = [ ... 
'title = {Reproductive ecology of the slow worm (\emph{Anguis fragilis}) in the northwest {I}berian {P}eninsula}, ' ...
'journal = {Animal Biology}, ' ...
'year = {2004}, ' ...
'author = {Ferreiro, R. and Galan, P.}, ' ....
'volume = {54}, ' ...
'pages = {353--371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

