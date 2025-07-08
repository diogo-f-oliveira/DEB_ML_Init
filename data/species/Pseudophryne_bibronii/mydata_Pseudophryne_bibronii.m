function [data, auxData, metaData, txtData, weights] = mydata_Pseudophryne_bibronii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Myobatrachidae';
metaData.species    = 'Pseudophryne_bibronii'; 
metaData.species_en = 'Bibron''s toadlet'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb';  'Lp'; 'Li'; 'Wd0'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'E0'; 'Eb'; 'Ej'; 'Ri'}; 
metaData.data_1     = {'t-Le'; 't-WdVe'; 't-WdYe'; 't-Wde'; 't-JOe'; 'T-ab'}; 

metaData.COMPLETE = 3.3; % using criteria of LikaKear2011

metaData.author   = {'Casey Mueller'; 'Starrlight Augustine'; 'Bas Kooijman'};    
metaData.date_subm = [2011 07 04];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvanplan, Tromso'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 21];


%% set data
% zero-variate data
data.ab = 39;        units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'MuelAugu2012';   
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 185;       units.aj = 'd';   label.aj = 'age at metam';           bibkey.aj = 'MuelAugu2012';
  temp.aj = C2K(12); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 14*30.5;   units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'MuelAugu2012';
  temp.ap = C2K(12); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 1825;      units.am = 'd';   label.am = 'life span';              bibkey.am = 'MuelAugu2012';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.58;     units.Lb  = 'cm'; label.Lb  = 'total length at birth'; bibkey.Lb  = 'MuelAugu2012';  
data.Lp  = 2.2;      units.Lp  = 'cm'; label.Lp  = 'ultimate total length'; bibkey.Lp  = 'MuelAugu2012';
data.Li  = 3.2;      units.Li  = 'cm'; label.Li  = 'ultimate total length'; bibkey.Li  = 'MuelAugu2012';

data.Wd0 = 2.68e-3;  units.Wd0 = 'g';  label.Wd0 = 'initial dry weight of egg'; bibkey.Wd0 = 'MuelAugu2012';
data.Wdb = 1.48e-3 + 0.92e-3;  units.Wdb = 'g'; label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'MuelAugu2012';
data.Wdj = 23.19e-3 + 1.17e-3; units.Wdj = 'g'; label.Wdj = 'dry weight at metam'; bibkey.Wdj = 'MuelAugu2012';
data.Wdp = 0.15;     units.Wdp = 'g';  label.Wdp = 'dry weight at puberty'; bibkey.Wdp = 'MuelAugu2012';
data.Wdi = 0.2;      units.Wdi = 'g';  label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'MuelAugu2012';

data.E0 = 65.03;     units.E0 = 'J';   label.E0 = 'energy in egg';          bibkey.E0 = 'MuelAugu2012';
data.Eb = 31.69 + 21.11; units.Eb = 'J'; label.Eb = 'energy at hatch';      bibkey.Eb = 'MuelAugu2012';
data.Ej = 464.02;    units.Ej = 'J';   label.Ej = 'energy at metam';        bibkey.Ej = 'MuelAugu2012';

data.Ri  = 0.55;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'MuelAugu2012';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-L data
data.tL = [20 40 100 185;    % d, age (includes embryo-stage)
        0.3 0.4 0.6 1.0]'; % cm, physical length at f and T
units.tL   = {'d', 'cm'};  label.tL = {'age', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Muel2011';
  
%  mass data
% gut/ yolk free body mass 
a2Wd = [ ...
%age (d)	Dry gut-free body mass (mg)	95% CI
%0	0   	0
15	0.45	0.25
22	0.89	0.09
27	1.12	0.13
31	1.35	0.11];  
data.aWV = a2Wd(:,[1 2]); 
units.aWV = {'d', 'mg'};  label.aWV = {'age', 'dry gut-free non-yolk mass'};  
temp.aWV  = C2K(12);  units.temp.aWV = 'K'; label.temp.aWV = 'temperature';
bibkey.aWV = 'Muel2011';

a2WdY = [ ...
%  age (d)	Dry yolk mass (mg)	95% CI
0	2.68        	0.11
22	1.4     	    0.68
27	1.116666667 	0.309552994
31	1.1         	0.598778888];
data.aWY = a2WdY(:,[1 2]); 
units.aWY = {'d', 'mg'};  label.aWY = {'age', 'dry yolk mass'};  
temp.aWY  = C2K(12);  units.temp.aWY = 'K'; label.temp.aWY = 'temperature';
bibkey.aWY = 'Muel2011';

data.aWtot = [ ... age (day), total dry mass (g)
0	0.00268
22	0.00229
27	0.00224
31	0.00245
40	0.00244
67	0.00376
75	0.00645
84	0.00570
89	0.00525
97	0.00900
104	0.01315
111	0.01319
139	0.01704
146	0.03042
165	0.02764
180	0.02797
185	0.02436];
data.aWtot(:,2) = data.aWtot(:,2) * 1e3; % convert g to mg
units.aWtot   = {'d', 'mg'};  label.aWtot = {'age', 'dry total mass'};  
temp.aWtot    = C2K(12);  units.temp.aWtot = 'K'; label.temp.aWtot = 'temperature';
bibkey.aWtot = 'Muel2011';

% Respiration data
data.aJO = [ ...
%Age (days)	MO2 (mumol/h)
4	0.00529908;
5	0.00645296;
8	0.00855802;
10	0.00732260;
11	0.00829469;
14	0.01760408;
18	0.02036324;
19	0.02517567;
22	0.02431655;
26	0.03691335;
31	0.05343705;
40	0.06783138;
45	0.11294029;
47	0.13512691;
51	0.15194239;
52	0.13168092;
54	0.15740565;
67	0.14291021;
68	0.19775125;
69	0.17882236;
74	0.28403465;
75	0.31153198;
77	0.29239707;
83	0.37648496;
84	0.34826791;
89	0.45098974;
90	0.42409238;
97	0.50717320;
104	0.45206995;
111	0.50565816;
139	0.93455960;
146	1.05468521;
153	1.23111831;
160	1.19439212;
165	1.29445722;
168	1.08511166;
173	1.39973440;
180	1.31134938;
181	1.21421015];
units.aJO  = {'d', 'mumol/h'}; label.aJO = {'age', 'O2 consumption'};  
temp.aJO   = C2K(12); units.temp.aJO = 'K'; label.temp.aJO = 'temperature';
bibkey.aJO = 'Muel2011';
    
% Arhennius information (we assume that for each temperature E_0 is exactly the same)
data.Tab = [ ... % 1/T (1/K)	rate = ln(1/d)
0.003571429	-4.941642423;
0.003508772	-3.850147602;
0.003448276	-3.044522438;
0.003389831	-2.833213344];
data.Tab(:,1) = K2C(1./data.Tab(:,1)); % convert to C
data.Tab(:,2) = exp(-data.Tab(:,2)); % convert to d
units.Tab  = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Muel2011';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Results of this entry are reported in MuelAug2012';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Feeding tadpole stage between birth and metamorphosis: typical frog development';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P7FX'; % Cat of Life
metaData.links.id_ITIS = '664687'; % ITIS
metaData.links.id_EoL = '1025125'; % Ency of Life
metaData.links.id_Wiki = 'Pseudophryne_bibronii'; % Wikipedia
metaData.links.id_ADW = 'Pseudophryne_bibronii'; % ADW
metaData.links.id_Taxo = '88189'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pseudophryne+bibronii'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudophryne_bibronii}}';
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
bibkey = 'MuelAugu2012'; type = 'Article'; bib = [ ... 
'author = {Mueller, C. and Augustine, S. and Kooijman, S. A. L. M. and Kearney, M. and Seymour, R.}, ' ... 
'year = {2012}, ' ...
'title = {The tradeoff between maturation and growth during accelerated development of frogs.}, ' ...
'journal = {Comp. Physiol. Biochem. A}, ' ...
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/4ZMA4WX3/item-details}}, '...
'volume = {163}, ' ...
'pages = {103--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Muel2011'; type = 'Misc'; bib = ...
'note = {Data from Casey Mueller}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
